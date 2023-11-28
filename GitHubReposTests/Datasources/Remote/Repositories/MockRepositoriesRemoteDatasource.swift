//
//  MockRepositoriesRemoteDatasource.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation
@testable import GitHubRepos

final class MockRepositoriesRemoteDatasource: RepositoriesRemoteDatasourceProtocol {
    var repositoriesResponse: ItemsResponse<Repository>?
    
    func getRepositories(query: String) async throws -> ItemsResponse<Repository> {
        if let repositoriesResponse {
            return repositoriesResponse
        } else {
            throw MockNetworkError.noRepositories
        }
    }
}
