//
//  URLSessionConfiguration+.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation

extension URLSessionConfiguration {
    static var mockDefault: URLSessionConfiguration {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self] + (config.protocolClasses ?? [])
        return config
    }
}

extension URL {
    static var gitHubAPI = URL(string: "https://api.github.com")!
}
