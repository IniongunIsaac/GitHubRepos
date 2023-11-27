//
//  UsersRemoteDatasource.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

struct UsersRemoteDatasource: UsersRemoteDatasourceProtocol {
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    func getUsers(query: String) async throws -> ItemsResponse<User> {
        try await service.makeRequest(
            endpoint: .users,
            method: .get,
            parameters: ["q": query],
            headers: nil,
            responseType: ItemsResponse<User>.self
        )
    }
    
    func getUser(username: String) async throws -> User {
        try await service.makeRequest(
            endpoint: .userDetails(username),
            method: .get,
            parameters: nil,
            headers: nil,
            responseType: User.self
        )
    }
    
    func getUserRepositories(username: String) async throws -> [Repository] {
        try await service.makeRequest(
            endpoint: .userRepositories(username),
            method: .get,
            parameters: nil,
            headers: nil,
            responseType: [Repository].self
        )
    }
}
