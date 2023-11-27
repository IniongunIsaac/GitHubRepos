//
//  UsersRemoteDatasourceProtocol.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

protocol UsersRemoteDatasourceProtocol {
    func getUsers(query: String) async throws -> ItemsResponse<User>
    
    func getUser(username: String) async throws -> User
    
    func getUserRepositories(username: String) async throws -> [Repository]
}
