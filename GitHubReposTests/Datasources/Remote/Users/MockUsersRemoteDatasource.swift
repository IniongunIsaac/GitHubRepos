//
//  MockUsersRemoteDatasource.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation
@testable import GitHubRepos

final class MockUsersRemoteDatasource: UsersRemoteDatasourceProtocol {
    var userRepositories: [Repository]?
    var usersResponse: ItemsResponse<User>?
    var user: User?
    
    func getUsers(query: String) async throws -> ItemsResponse<User> {
        if let usersResponse {
            return usersResponse
        } else {
            throw MockNetworkError.invalidResponse
        }
    }
    
    func getUser(username: String) async throws -> User {
        if let user {
            return user
        } else {
            throw MockNetworkError.userNotFound
        }
    }
    
    func getUserRepositories(username: String) async throws -> [Repository] {
        if let userRepositories {
            return userRepositories
        } else {
            throw MockNetworkError.noRepositories
        }
    }
    
    
}
