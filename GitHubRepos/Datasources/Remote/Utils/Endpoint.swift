//
//  Endpoint.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

enum Endpoint {
    case repositories
    case users
    case userRepositories(String)
    case userDetails(String)
    case invalidURL
    
    private var kpath: String {
        switch self {
        case .repositories:
            return "search/repositories"
        case .users:
            return "search/users"
        case let .userRepositories(username):
            return "users/\(username)/repos"
        case let .userDetails(username):
            return "users/\(username)"
        case .invalidURL:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .invalidURL:
            return "github"
        default:
            return "https://api.github.com/\(kpath)"
        }
    }
}
