//
//  UsersLocalDatasourceProtocol.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

protocol UsersLocalDatasourceProtocol {
    func getUsers() -> [User]
    func saveUsers(_ users: [User])
}
