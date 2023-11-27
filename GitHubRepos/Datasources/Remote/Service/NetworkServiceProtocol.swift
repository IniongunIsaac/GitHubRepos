//
//  NetworkServiceProtocol.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func makeRequest<T: Codable>(
        endpoint: Endpoint,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: [String: String]?,
        responseType: T.Type
    ) async throws -> T
}
