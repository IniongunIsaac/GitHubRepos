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
    private let localDatasource: RepositoriesLocalDatasourceProtocol
    
    @Published var repositories = [Repository]()
    private var allRepositories = [Repository]()
    @Published var showLoader = false
    @Published var showError = false
    @Published var errorMessage = ""
    
    init(
        remoteDatasource: RepositoriesRemoteDatasourceProtocol = RepositoriesRemoteDatasource(),
        localDatasource: RepositoriesLocalDatasourceProtocol = RepositoriesLocalDatasource()
    ) {
        self.remoteDatasource = remoteDatasource
        self.localDatasource = localDatasource
    }
    
    func searchRepositories(query: String) async {
        showLoader.toggle()
        do {
            let reposResponse = try await remoteDatasource.getRepositories(query: query)
            showLoader.toggle()
            didGetRepositories(reposResponse.items ?? [])
        } catch {
            kprint(error.localizedDescription, logType: .error)
            showLoader.toggle()
            errorMessage = error.localizedDescription
            showError.toggle()
        }
    }
    
    private func didGetRepositories(_ repos: [Repository]) {
        repositories.appendIfNotExists(contentsOf: repos)
        localDatasource.saveRepositories(repos)
        allRepositories = localDatasource.getRepositories()
    }
    
    func getRepositories() {
        allRepositories = localDatasource.getRepositories()
        repositories = allRepositories
    }
    
    func filterRepositories(text: String) {
        if text.isEmpty {
            repositories = allRepositories
        } else {
            repositories = allRepositories.filter {
                $0.fullName.orEmpty.insensitiveContains(text) ||
                $0.repoDescription.orEmpty.insensitiveContains(text) ||
                $0.language.orEmpty.insensitiveContains(text)
            }
        }
    }
}
