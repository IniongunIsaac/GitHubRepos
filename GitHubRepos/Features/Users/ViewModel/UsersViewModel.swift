//
//  UsersViewModel.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
    
    private let remoteDatasource: UsersRemoteDatasourceProtocol
    private let repositoriesLocalDatasource: RepositoriesLocalDatasourceProtocol
    private let usersLocalDatasource: UsersLocalDatasourceProtocol
    
    private var allUsers = [User]()
    @Published var users = [User]()
    @Published var showLoader = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var userRepositories = [Repository]()
    
    init(
        remoteDatasource: UsersRemoteDatasourceProtocol = UsersRemoteDatasource(),
        repositoriesLocalDatasource: RepositoriesLocalDatasourceProtocol = RepositoriesLocalDatasource(),
        usersLocalDatasource: UsersLocalDatasourceProtocol = UsersLocalDatasource()
    ) {
        self.remoteDatasource = remoteDatasource
        self.repositoriesLocalDatasource = repositoriesLocalDatasource
        self.usersLocalDatasource = usersLocalDatasource
    }
    
    func getUsers() {
        allUsers = usersLocalDatasource.getUsers()
        users = allUsers
    }
    
    func searchUsers(query: String) async {
        showLoader.toggle()
        do {
            let usersResponse = try await remoteDatasource.getUsers(query: query)
            showLoader.toggle()
            didGetUsers(usersResponse.items ?? [])
        } catch {
            showLoader.toggle()
            errorMessage = error.localizedDescription
            kprint(error.localizedDescription, logType: .error)
        }
    }
    
    private func didGetUsers(_ users: [User]) {
        self.users.appendIfNotExists(contentsOf: users)
        usersLocalDatasource.saveUsers(users)
        allUsers = usersLocalDatasource.getUsers()
    }
    
    func getUserAndRepos() async {
        guard let username = user?.login, let userId = user?.id else { return }
        if let user = usersLocalDatasource.getUser(id: userId) {
            self.user = user
        }
        userRepositories = repositoriesLocalDatasource.getUserRepositories(id: userId)
        
        showLoader.toggle()
        
        let userDetails = Task { try await remoteDatasource.getUser(username: username) }
        let userRepositories = Task { try await remoteDatasource.getUserRepositories(username: username) }
        
        do {
            let userResult = try await userDetails.value
            let userRepos = try await userRepositories.value
            
            showLoader.toggle()
            
            user = userResult
            repositoriesLocalDatasource.saveRepositories(userRepos)
            self.userRepositories = repositoriesLocalDatasource.getUserRepositories(id: userId)
            usersLocalDatasource.saveUsers([userResult])
            
        } catch {
            showLoader.toggle()
            kprint(error.localizedDescription, logType: .error)
        }
    }
    
    func filterUsers(text: String) {
        if text.isEmpty {
            users = allUsers
        } else {
            users = allUsers.filter {
                $0.displayName.insensitiveContains(text) ||
                $0.location.orEmpty.insensitiveContains(text) ||
                $0.nodeID.orEmpty.insensitiveContains(text)
            }
        }
    }
}
