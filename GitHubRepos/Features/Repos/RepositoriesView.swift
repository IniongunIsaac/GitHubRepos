//
//  RepositoriesView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct RepositoriesView: View {
    @State private var visible: Bool = true
    var body: some View {
        NavigationView {
            VStack {
                SearchView(placeholder: "Search for repositories") { searchText in
                    
                }
                Spacer()
                EmptyStateView(message: "Search Github for repositories, issues and pull requests!")
                    .visible(visible)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .navigationTitle("Repositories")
        }
    }
}

#Preview {
    RepositoriesView()
}
