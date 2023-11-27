//
//  RepositoriesViewModel.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

@MainActor
final class RepositoriesViewModel: ObservableObject {
    private let remoteDatasource: RepositoriesRemoteDatasourceProtocol
    @Published var repositories = [Repository]()
    @Published var showLoader = false
    
    init(remoteDatasource: RepositoriesRemoteDatasourceProtocol = RepositoriesRemoteDatasource()) {
        self.remoteDatasource = remoteDatasource
    }
    
    func getRepositories(query: String) async {
        showLoader.toggle()
        do {
            let reposResponse = try await remoteDatasource.getRepositories(query: query)
            showLoader.toggle()
            repositories = reposResponse.items ?? []
        } catch {
            //TODO: show error message?
            showLoader.toggle()
            kprint(error.localizedDescription, logType: .error)
        }
    }
}
