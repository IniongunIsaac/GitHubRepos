//
//  UserView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI
import Kingfisher

struct UserView: View {
    var user: User
    var action: VoidAction? = nil
    @State private var isTapped = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                KFImage(URL(string: user.avatarURL ?? ""))
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.displayName)
                        .foregroundColor("#408AAA".color)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text(user.nodeID ?? "--node--id--")
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("\(user.id ?? 0)")
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black.opacity(0.15), lineWidth: 0.5)
        )
        .scaleEffect(isTapped ? 1.1 : 1)
        .animation(.easeInOut)
        .onTapGesture {
            withAnimation {
                isTapped = true
                runAfter(0.1) {
                    isTapped = false
                    runAfter(0.2) {
                        action?()
                    }
                }
            }
        }
    }
}

//#Preview {
//    UserView()
//        .padding()
//}
