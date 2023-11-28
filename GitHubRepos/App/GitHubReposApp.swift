//
//  GitHubReposApp.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 24/11/2023.
//

import SwiftUI

@main
struct GitHubReposApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var preferenceStore = PreferenceStore()
    
    var body: some Scene {
        WindowGroup {
            MainTabsView()
                .environmentObject(PreferenceStore())
                .accentColor(.black)
                .preferredColorScheme(.light)
        }
        .onChange(of: scenePhase) { newScenePhase in
            if [.inactive, .background].contains(newScenePhase) {
                preferenceStore.selectedTabItem = .home
            }
        }
    }
}
