//
//  Repository+.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation
@testable import GitHubRepos
import RealmSwift

extension Repository {
    static let testRepository1 = Repository(
        id: 1,
        owner: .testUser1,
        language: "Python",
        topics: List()
    )
    
    static let testRepository2 = Repository(
        id: 2,
        owner: .testUser2,
        language: "Python",
        topics: List()
    )
}
