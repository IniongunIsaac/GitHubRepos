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
                
                Text(repository.fullName ?? "full/name")
                    .lineLimit(1)
                    .font(.system(size: 15, weight: .regular))
                
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
            
            Text(repository.description ?? "--description here--")
                .font(.system(size: 15, weight: .regular))
                .lineLimit(2)
            
            RepositoryTagsView(tags: repository.topics ?? [])
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
