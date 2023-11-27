//
//  UsersLocalDatasource.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation
import RealmSwift

struct UsersLocalDatasource: UsersLocalDatasourceProtocol {
    private let realm = try! Realm()
    
    func getUsers() -> [User] {
        Array(realm.objects(User.self))
    }
    
    func saveUsers(_ users: [User]) {
        do {
            try realm.write {
                realm.add(users, update: .modified)
            }
        } catch {
            kprint("unable to save users => \(error)", logType: .error)
        }
    }
    
    func getUser(id: Int) -> User? {
        realm.object(ofType: User.self, forPrimaryKey: id)
    }
}
