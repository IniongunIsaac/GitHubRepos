//
//  MockURLProtocol.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    static var data: Data?
    static var error: Error?
    static var urlResponse: URLResponse?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canInit(with task: URLSessionTask) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        if let urlResponse = MockURLProtocol.urlResponse {
            client?.urlProtocol(self, didReceive: urlResponse, cacheStoragePolicy: .notAllowed)
        }
        
        if let data = MockURLProtocol.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
