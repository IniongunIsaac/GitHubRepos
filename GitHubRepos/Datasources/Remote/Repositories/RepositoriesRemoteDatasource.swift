//
//  RepositoriesRemoteDatasource.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

struct RepositoriesRemoteDatasource: RepositoriesRemoteDatasourceProtocol {
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    func getRepositories(query: String) async throws -> RepositoriesResponse {
        try await service.makeRequest(
            endpoint: .repositories,
            method: .get,
            parameters: ["q": query],
            headers: nil,
            responseType: RepositoriesResponse.self
        )
    }
}
