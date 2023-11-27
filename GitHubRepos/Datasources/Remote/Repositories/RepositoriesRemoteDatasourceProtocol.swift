//
//  RepositoriesRemoteDatasourceProtocol.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

protocol RepositoriesRemoteDatasourceProtocol {
    func getRepositories(query: String) async throws -> ItemsResponse<Repository>
}
