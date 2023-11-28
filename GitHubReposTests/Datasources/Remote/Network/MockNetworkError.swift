//
//  MockNetworkError.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation

enum MockNetworkError: Error {
    case invalidResponse
    case userNotFound
    case noRepositories
}
