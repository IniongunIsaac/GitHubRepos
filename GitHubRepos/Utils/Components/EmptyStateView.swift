//
//  EmptyStateView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct EmptyStateView: View {
    var imageResource: ImageResource = .emptyStateSearch
    var message: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageResource)
                .font(.largeTitle)
                
            Text(message)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    EmptyStateView(message: "Search Github for repositories, issues and pull requests!")
}

