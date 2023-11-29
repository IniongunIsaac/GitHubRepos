//
//  RepositoryView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI
import Kingfisher

struct RepositoryView: View {
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center, spacing: 10) {
                KFImage(URL(string: repository.owner?.avatarURL ?? ""))
                    .placeholder {
                        Image(.profilePlaceholder)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .cornerRadius(10)
                
                HStack(spacing: 0) {
                    Text("\(repository.owner?.login ?? "username")/")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor("#62006A".color)
                    
                    Text(repository.name ?? "name")
                        .font(.system(size: 12, weight: .semibold))
                }
                .lineLimit(1)
                
                Spacer()
                
                IconLabelView(
                    imageResource: .star,
                    text: "\(repository.stargazersCount ?? 0)"
                )
                
                IconLabelView(
                    imageResource: .greenCircle,
                    text: "\(repository.language ?? "Lang")"
                )
                
            }
            
            Text(repository.repoDescription ?? "--no-description--")
                .font(.system(size: 15, weight: .regular))
                .lineLimit(2)
            
            RepositoryTagsView(tags: Array(repository.topics))
                .visible(repository.hasTopics)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
    }
}

//#Preview {
//    RepositoryView()
//        .padding()
//}
