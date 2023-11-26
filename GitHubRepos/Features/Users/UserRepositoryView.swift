//
//  UserRepositoryView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 26/11/2023.
//

import SwiftUI

struct UserRepositoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(alignment: .center, spacing: 10) {
                Text("IsaacIniongun/GitHubRepos")
                    .lineLimit(1)
                    .font(.system(size: 15, weight: .regular))
                
                Text("Public")
                    .font(.system(size: 12, weight: .light))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                    )
                
                Spacer()
                
                IconLabelView(imageResource: .star, text: "10")
                
                IconLabelView(imageResource: .greenCircle, text: "Vue")
                
            }
            
            Text("These are random words that will be replaced in due time. Config files for my github profile hese are random words that will be replaced in due time. Config files for my github profile")
                .font(.system(size: 15, weight: .regular))
                .lineLimit(2)
            
            HStack {
                Text("Forked from discordify")
                
                Text("Updated 4 days ago")
            }
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.gray)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
    }
}

#Preview {
    UserRepositoryView()
}
