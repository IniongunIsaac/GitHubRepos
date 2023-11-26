//
//  UserView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(.profilePlaceholder)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Isaac Iniongun")
                    .foregroundColor("#408AAA".color)
                    .font(.system(size: 16, weight: .semibold))
                
                Text("iOS Engineer")
                    .font(.system(size: 14, weight: .regular))
                
                Text("These are random words that will be replaced in due time. Config files for my github profile hese are random words that will be replaced in due time. Config files for my github profile")
                    .font(.system(size: 14, weight: .regular))
                    .lineLimit(2)
                
                Text("Lagos, Nigeria momoko@gmail.com")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
    }
}

#Preview {
    UserView()
        .padding()
}
