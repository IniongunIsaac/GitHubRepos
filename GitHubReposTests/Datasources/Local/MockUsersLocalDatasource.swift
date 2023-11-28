//
//  MockUsersLocalDatasource.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import Foundation
@testable import GitHubRepos

final class MockUsersLocalDatasource: UsersLocalDatasourceProtocol {
    private var users = [User]()
    
    func getUsers() -> [User] {
        users
    }
    
    func saveUsers(_ users: [User]) {
        self.users = users
    }
    
    func getUser(id: Int) -> User? {
        users.first { $0.id == id }
    }
    
    
}
