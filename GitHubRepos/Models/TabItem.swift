//
//  TabItem.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import Foundation
import SwiftUI

enum TabItem: Int {
    case home
    case repositories
    case users
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .repositories:
            return "Repositories"
        case .users:
            return "Users"
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .home:
            return .homeTab
        case .repositories:
            return .reposTab
        case .users:
            return .userTab
        }
    }
    
    var selectedImageResource: ImageResource {
        switch self {
        case .home:
            return .homeTabSelected
        case .repositories:
            return .reposTabSelected
        case .users:
            return .userTabSelected
        }
    }
}
