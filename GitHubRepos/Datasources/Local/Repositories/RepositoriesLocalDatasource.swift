//
//  RepositoriesLocalDatasource.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation
import RealmSwift

struct RepositoriesLocalDatasource: RepositoriesLocalDatasourceProtocol {
    private let realm = try! Realm()
    
    func getRepositories() -> [Repository] {
        Array(realm.objects(Repository.self))
    }
    
    func saveRepositories(_ repositories: [Repository]) {
        do {
            try realm.write {
                realm.add(repositories, update: .modified)
            }
        } catch {
            kprint("unable to save repositories => \(error)", logType: .error)
        }
    }
    
    func getUserRepositories(id: Int) -> [Repository] {
        let repositories = realm.objects(Repository.self)
        let userRepositories = repositories.where {
            $0.owner.id == id
        }
        return Array(userRepositories)
    }
    
    
}
