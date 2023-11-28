//
//  MockRepositoriesLocalDatasource.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation
@testable import GitHubRepos

final class MockRepositoriesLocalDatasource: RepositoriesLocalDatasourceProtocol {
    private var repositories = [Repository]()
    
    func getRepositories() -> [Repository] {
        repositories
    }
    
    func saveRepositories(_ repositories: [Repository]) {
        self.repositories = repositories
    }
    
    func getUserRepositories(id: Int) -> [Repository] {
        repositories.filter { $0.owner?.id == id }
    }
    
}
