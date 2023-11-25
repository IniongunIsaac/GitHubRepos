//
//  HomeCardType.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import Foundation
import SwiftUI

enum HomeCardType: String {
    case users
    case repositories
    
    var imageResource: ImageResource {
        switch self {
        case .users:
            return .usersHome
        case .repositories:
            return .reposHome
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .users:
            return "#ECF5F8".color
        case .repositories:
            return "#F6EDF8".color
        }
    }
}
