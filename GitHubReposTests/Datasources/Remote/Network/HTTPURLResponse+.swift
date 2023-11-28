//
//  HTTPURLResponse+.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation

extension URLResponse {
    static func withCode(_ code: Int) -> HTTPURLResponse? {
        HTTPURLResponse(
            url: .gitHubAPI,
            statusCode: code,
            httpVersion: nil,
            headerFields: nil
        )
    }
}
