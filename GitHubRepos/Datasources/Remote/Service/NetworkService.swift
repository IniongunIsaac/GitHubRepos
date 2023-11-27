//
//  NetworkService.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation
import Network

final class NetworkService: NetworkServiceProtocol {
    private let monitor = NWPathMonitor()
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                kprint("Network is available")
            } else {
                kprint("No network connection")
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func makeRequest<T: Codable>(
        endpoint: Endpoint,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard monitor.currentPath.status == .satisfied else {
            throw NetworkError.noInternetConnection
        }
        
        guard var urlComponents = URLComponents(string: endpoint.path),
              let requestURL = urlComponents.url
        else {
            throw NetworkError.invalidURL
        }
        
        if let parameters, method == .get {
            urlComponents.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        
        kprint("Request URL: \(requestURL.absoluteString)")
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = method.rawValue
        
        if let parameters, method == .post, let requestBody = parameters.data {
            urlRequest.httpBody = requestBody
        }
        
        if let headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        do {
            guard let response = try? data.decode(into: T.self) else {
                throw NetworkError.decodingFailed
            }
            
            kprint("Request Response:")
            kprint(response.prettyJson)
            
            return response
        } catch {
            throw NetworkError.requestFailed
        }
    }
}
