//
//  PreferenceStore.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import Foundation
import SwiftUI

final class PreferenceStore: ObservableObject {
    @AppStorage("selectedTabItem") var selectedTabItem: TabItem = .home
}
