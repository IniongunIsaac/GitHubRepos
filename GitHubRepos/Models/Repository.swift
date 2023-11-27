//
//  Repository.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation
import RealmSwift

class Repository: Object, Codable, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var nodeID: String?
    @Persisted var name: String?
    @Persisted var fullName: String?
    @Persisted var owner: User?
    @Persisted var htmlURL: String?
    @Persisted var repoDescription: String?
    @Persisted var createdAt: String?
    @Persisted var pushedAt: String?
    @Persisted var updatedAt: String?
    @Persisted var stargazersCount: Int?
    @Persisted var language: String?
    @Persisted var visibility: String?
    @Persisted var topics: List<String>
    
    var hasTopics: Bool {
        topics.isNotEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case repoDescription = "description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case stargazersCount = "stargazers_count"
        case language
        case visibility
        case topics
    }
}
