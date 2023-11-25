//
//  RepositoriesView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct RepositoriesView: View {
    @State private var visible: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                SearchView(placeholder: "Search for repositories") { searchText in
                    
                }
                .padding(.horizontal)
                .padding(.top, 4)
                
                Spacer()
                
                EmptyStateView(message: "Search Github for repositories, issues and pull requests!")
                    .visible(visible)
                
                ScrollView {
                    ForEach(1...10, id: \.self) { _ in
                        RepositoryView()
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 8)
            }
            .navigationTitle("Repositories")
        }
    }
}

#Preview {
    RepositoriesView()
}
