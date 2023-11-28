//
//  ResponseData.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation

enum ResponseData {
    static let success = """
            {
                "success": true
            }
        """.data(using: .utf8)
    
    static let failure = """
            {
                "success": "failed"
            }
        """.data(using: .utf8)
}
