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
    @Published var users = [User]()
    @Published var showLoader = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var userRepositories = [Repository]()
    
    init(remoteDatasource: UsersRemoteDatasourceProtocol = UsersRemoteDatasource()) {
        self.remoteDatasource = remoteDatasource
    }
    
    func getUsers(query: String) async {
        showLoader.toggle()
        do {
            let usersResponse = try await remoteDatasource.getUsers(query: query)
            showLoader.toggle()
            users = usersResponse.items ?? []
        } catch {
            showLoader.toggle()
            kprint(error.localizedDescription, logType: .error)
        }
    }
    
    func getUserAndRepos() async {
        guard let username = user?.login else { return }
        showLoader.toggle()
        
        let userDetails = Task { try await remoteDatasource.getUser(username: username) }
        let userRepositories = Task { try await remoteDatasource.getUserRepositories(username: username) }
        
        do {
            let userResult = try await userDetails.value
            let userRepos = try await userRepositories.value
            
            showLoader.toggle()
            
            user = userResult
            self.userRepositories = userRepos
            
        } catch {
            showLoader.toggle()
            kprint(error.localizedDescription, logType: .error)
        }
    }
}
