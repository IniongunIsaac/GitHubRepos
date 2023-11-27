//
//  RepositoriesView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct RepositoriesView: View {
    @StateObject private var viewModel = RepositoriesViewModel()
    @State private var visible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                LoaderView()
                    .visible(viewModel.showLoader)
                
                SearchView(placeholder: "Search for repositories") { searchText in
                    Task {
                        await viewModel.getRepositories(query: searchText)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 0)
                
                Spacer()
                    .visible(viewModel.repositories.isEmpty)
                
                EmptyStateView(message: "Search Github for repositories, issues\nand pull requests!")
                    .visible(viewModel.repositories.isEmpty)
                
                Spacer()
                    .visible(viewModel.repositories.isEmpty)
                
                ScrollView {
                    ForEach(viewModel.repositories) { repository in
                        RepositoryView(repository: repository)
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 8)
                .visible(viewModel.repositories.isNotEmpty)
            }
            .navigationTitle("Repositories")
        }
    }
}

#Preview {
    RepositoriesView()
}
