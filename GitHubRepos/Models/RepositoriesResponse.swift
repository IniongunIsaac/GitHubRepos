//
//  RepositoriesResponse.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

struct RepositoriesResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Repository]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
