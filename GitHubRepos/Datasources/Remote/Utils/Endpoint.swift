//
//  Endpoint.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

enum Endpoint {
    case repos
    case users
    
    var path: String {
        switch self {
        case .repos:
            return ""
        case .users:
            return ""
        }
    }
}
