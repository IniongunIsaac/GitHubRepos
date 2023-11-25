//
//  HomeView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var preferenceStore: PreferenceStore
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    HomeCardView(type: .users) {
                        preferenceStore.selectedTabItem = .users
                    }
                    
                    HomeCardView(type: .repositories) {
                        preferenceStore.selectedTabItem = .repositories
                    }
                }
                Spacer()
            }
            .padding([.top, .horizontal])
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
