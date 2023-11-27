//
//  UsersView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    @StateObject private var viewModel = UsersViewModel()
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack {
                LoaderView()
                    .visible(viewModel.showLoader)
                
                SearchView(
                    placeholder: "Search for users...",
                    searchAction: { searchText in
                        Task {
                            await viewModel.searchUsers(query: searchText)
                        }
                    }, filterAction:  { searchText in
                        viewModel.filterUsers(text: searchText)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 0)
                
                Spacer()
                    .visible(viewModel.users.isEmpty)
                
                EmptyStateView(message: "Search Github for users...")
                    .visible(viewModel.users.isEmpty)
                
                Spacer()
                    .visible(viewModel.users.isEmpty)
                
                ScrollView {
                    ForEach(viewModel.users) { user in
                        UserView(user: user) {
                            viewModel.user = user
                            showDetails.toggle()
                        }
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 8)
                .visible(viewModel.users.isNotEmpty)
                
                NavigationLink(destination: UserDetailsView(viewModel: viewModel), isActive: $showDetails) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.getUsers()
            }
        }
    }
}

#Preview {
    UsersView()
}
