//
//  UserDetailsView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 26/11/2023.
//

import SwiftUI

struct UserDetailsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                
                HStack(alignment: .top, spacing: 10) {
                    Image(.profilePlaceholder)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Isaac Iniongun")
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("iOS Engineer")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                
                Text("These are random words that will be replaced in due time. Config files for my github profile hese are random words that will be replaced in due time. Config files for my github profile")
                    .font(.system(size: 14, weight: .regular))
                
                HStack(spacing: 15) {
                    IconLabelView(
                        imageResource: .location,
                        text: "Lagos, Nigeria",
                        font: .system(size: 14),
                        spacing: 8
                    )
                    .foregroundColor(.gray)
                    
                    Link(destination: URL(string: "http://www.paige.com")!) {
                        IconLabelView(
                            imageResource: .link,
                            text: "http://www.paige.com",
                            font: .system(size: 14),
                            spacing: 8
                        )
                        .foregroundColor(.black)
                    }
                }
                
                IconLabelView(
                    imageResource: .followers,
                    text: "400 followers  .  30 following",
                    font: .system(size: 14),
                    spacing: 8
                )
                .foregroundColor(.gray)
                
                HStack {
                    Text("Repositories")
                        .font(.system(size: 15, weight: .medium))
                    
                    PillView(
                        text: "200",
                        font: .system(size: 12, weight: .medium),
                        textColor: .black,
                        bgColor: .gray.opacity(0.2),
                        hPadding: 8,
                        vPadding: 4,
                        radius: 15
                    )
                        
                }
                .padding(.top, 8)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 93, height: 1)
                    
                    Rectangle()
                        .fill("#F1F1F1".color)
                        .frame(height: 1)
                }
                .padding(.top, -6)
                
                EmptyStateView(
                    imageResource: .emptyStateRepos,
                    message: "This user  doesn’t have repositories yet, come back later :-)"
                )
                .centerHorizontally()
                .padding(.top, 100)
                .visible(false)
                
                ForEach(1...10, id: \.self) { _ in
                    UserRepositoryView()
                        .padding(.horizontal, 1)
                }
                .visible(true)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, -40)
    }
}

#Preview {
    UserDetailsView()
}
