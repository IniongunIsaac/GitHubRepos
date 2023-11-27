//
//  RepositoriesLocalDatasourceProtocol.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

protocol RepositoriesLocalDatasourceProtocol {
    func getRepositories() -> [Repository]
    func saveRepositories(_ repositories: [Repository])
    func getUserRepositories(id: Int) -> [Repository]
}
