//
//  RepositoryView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct RepositoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center, spacing: 10) {
                Image(.profilePlaceholder)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text("IsaacIniongun/GitHubRepos")
                    .lineLimit(1)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                IconLabelView(imageResource: .star, text: "10")
                
                IconLabelView(imageResource: .greenCircle, text: "Vue")
                
            }
            
            Text("These are random words that will be replaced in due time. Config files for my github profile hese are random words that will be replaced in due time. Config files for my github profile")
                .font(.system(size: 15, weight: .regular))
                .lineLimit(2)
            
            RepositoryTagsView(tags: tags)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
    }
}

#Preview {
    RepositoryView()
        .padding()
}
