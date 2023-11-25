//
//  MainTabsView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct MainTabsView: View {
    @EnvironmentObject private var preferenceStore: PreferenceStore
    
    var body: some View {
        TabView(selection: $preferenceStore.selectedTabItem) {
            HomeView()
                .tabItem {
                    Image(tabImage(for: .home))
                    Text("Home")
                }
                .tag(TabItem.home)
            
            RepositoriesView()
                .tabItem {
                    Image(tabImage(for: .repositories))
                    Text("Repositories")
                }
                .tag(TabItem.repositories)
            
            UsersView()
                .tabItem {
                    Image(tabImage(for: .users))
                    Text("Users")
                }
                .tag(TabItem.users)
        }
    }
    
    private func tabImage(for tab: TabItem) -> ImageResource {
        preferenceStore.selectedTabItem == tab ? tab.selectedImageResource : tab.imageResource
    }
}

#Preview {
    MainTabsView()
        .environmentObject(PreferenceStore())
}
