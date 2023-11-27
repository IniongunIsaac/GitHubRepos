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
    
    private var kpath: String {
        switch self {
        case .repositories:
            return "search/repositories"
        case .users:
            return "users"
        case let .userRepositories(username):
            return "users/\(username)/repos"
        case let .userDetails(username):
            return "users/\(username)"
        }
    }
    
    var path: String {
        "https://api.github.com/\(kpath)"
    }
}
