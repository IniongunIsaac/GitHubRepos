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
    
    convenience init(
        id: Int,
        login: String? = nil,
        nodeID: String? = nil,
        avatarURL: String? = nil,
        htmlURL: String? = nil,
        name: String? = nil,
        location: String? = nil,
        email: String? = nil,
        bio: String? = nil,
        publicRepos: Int? = nil,
        following: Int? = nil,
        followers: Int? = nil,
        createdAt: String? = nil,
        updatedAt: String? = nil
    ) {
        self.init()
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.htmlURL = htmlURL
        self.name = name
        self.location = location
        self.email = email
        self.bio = bio
        self.publicRepos = publicRepos
        self.following = following
        self.followers = followers
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
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
