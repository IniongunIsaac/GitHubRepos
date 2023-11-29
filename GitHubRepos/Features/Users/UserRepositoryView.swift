//
//  UserRepositoryView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 26/11/2023.
//

import SwiftUI

struct UserRepositoryView: View {
    var repo: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center, spacing: 10) {
                Text(repo.fullName ?? "")
                    .lineLimit(1)
                    .font(.system(size: 15, weight: .regular))
                
                Text(repo.visibility ?? "")
                    .font(.system(size: 12, weight: .light))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                    )
                
                Spacer()
                
                IconLabelView(imageResource: .star, text: "\(repo.stargazersCount ?? 0)")
                
                IconLabelView(imageResource: .greenCircle, text: "\(repo.language ?? "-lang-")")
                
            }
            
            Text(repo.repoDescription ?? "")
                .font(.system(size: 15, weight: .regular))
                .lineLimit(3)
                .visible(repo.repoDescription?.isNotEmpty ?? false)
            
            HStack {
                Link(destination: URL(string: repo.htmlURL ?? "")!) {
                    IconLabelView(
                        imageResource: .link,
                        text: "See Repository",
                        font: .system(size: 13),
                        spacing: 6
                    )
                    .foregroundColor(.blue)
                }
                
                Text("Updated on \(repo.updatedAt.orEmpty.dateFormatted())")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
    }
}

//#Preview {
//    UserRepositoryView()
//}
