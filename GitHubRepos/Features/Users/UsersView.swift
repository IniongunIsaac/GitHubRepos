//
//  UsersView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchView(placeholder: "Search for users...") { searchText in
                    
                }
                Spacer()
                EmptyStateView(message: "Search Github for users...")
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UsersView()
}
