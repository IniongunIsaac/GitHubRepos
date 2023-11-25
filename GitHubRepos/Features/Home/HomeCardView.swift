//
//  HomeCardView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct HomeCardView: View {
    var type: HomeCardType
    var action: VoidAction? = nil
    @State private var isTapped = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 40) {
                Image(type.imageResource)
                Text(type.rawValue.capitalized)
                    .fontWeight(.medium)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(type.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
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

#Preview {
    HomeCardView(type: .repositories)
        .previewLayout(.sizeThatFits)
}
