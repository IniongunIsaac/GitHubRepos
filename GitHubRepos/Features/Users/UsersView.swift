//
//  UsersView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(placeholder: "Search for users...") { searchText in
                    
                }
                .padding(.horizontal)
                .padding(.top, 4)
                
                
                EmptyStateView(message: "Search Github for users...")
                    .visible(false)
                
                ScrollView {
                    ForEach(1...20, id: \.self) { _ in
                        UserView()
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                            .onTapGesture {
                                withAnimation {
                                    showDetails.toggle()
                                }
                            }
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 8)
                
                NavigationLink(destination: UserDetailsView(), isActive: $showDetails) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UsersView()
}
