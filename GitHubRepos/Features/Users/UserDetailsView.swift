//
//  UserDetailsView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 26/11/2023.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {
    @StateObject var viewModel: UsersViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                LoaderView()
                    .visible(viewModel.showLoader)
                
                HStack(alignment: .top, spacing: 10) {
                    KFImage(URL(string: viewModel.user?.avatarURL ?? ""))
                        .placeholder {
                            Image(.profilePlaceholder)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .cornerRadius(22.5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.user?.displayName ?? "")
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text(viewModel.user?.nodeID ?? "")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                
                Text(viewModel.user?.bio ?? "Bio")
                    .font(.system(size: 14, weight: .regular))
                
                HStack(spacing: 15) {
                    IconLabelView(
                        imageResource: .location,
                        text: viewModel.user?.location ?? "--no-location--",
                        font: .system(size: 14),
                        spacing: 8
                    )
                    .foregroundColor(.gray)
                    
                    Link(destination: URL(string: viewModel.user?.htmlURL ?? "")!) {
                        IconLabelView(
                            imageResource: .link,
                            text: viewModel.user?.htmlURL ?? "Profile",
                            font: .system(size: 14),
                            spacing: 8
                        )
                        .foregroundColor(.blue)
                    }
                }
                
                IconLabelView(
                    imageResource: .followers,
                    text: viewModel.user?.followerFollowing ?? "",
                    font: .system(size: 14),
                    spacing: 8
                )
                .foregroundColor(.gray)
                
                HStack {
                    Text("Repositories")
                        .font(.system(size: 15, weight: .medium))
                    
                    PillView(
                        text: "\(viewModel.user?.publicRepos ?? 0)",
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
                .visible(viewModel.userRepositories.isEmpty)
                
                ForEach(viewModel.userRepositories) { repo in
                    UserRepositoryView(repo: repo)
                        .padding(.horizontal, 1)
                }
                .visible(viewModel.userRepositories.isNotEmpty)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, -40)
        .onAppear {
            Task {
                await viewModel.getUserAndRepos()
            }
        }
    }
}

//#Preview {
//    UserDetailsView()
//}
