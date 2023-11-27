//
//  User.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation
import RealmSwift

class User: Object, Codable, Identifiable {
    @Persisted var login: String?
    @Persisted(primaryKey: true) var id: Int
    @Persisted var nodeID: String?
    @Persisted var avatarURL: String?
    @Persisted var htmlURL: String?
    @Persisted var name: String?
    @Persisted var location: String?
    @Persisted var email: String?
    @Persisted var bio: String?
    @Persisted var publicRepos: Int?
    @Persisted var following: Int?
    @Persisted var followers: Int?
    @Persisted var createdAt: String?
    @Persisted var updatedAt: String?
    
    var displayName: String {
        name ?? login ?? "--no--name--"
    }
    
    var followerFollowing: String {
        "\(followers ?? 0) followers  .  \(following ?? 0) following"
    }

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case name, location, email, bio
        case publicRepos = "public_repos"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
