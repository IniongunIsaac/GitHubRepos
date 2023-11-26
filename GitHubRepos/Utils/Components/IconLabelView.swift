//
//  IconLabelView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct IconLabelView: View {
    var imageResource: ImageResource
    var text: String
    var font: Font = .body
    var spacing: CGFloat = 4
    
    var body: some View {
        HStack(spacing: spacing) {
            Image(imageResource)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(text)
                .font(font)
        }
    }
}

#Preview {
    IconLabelView(imageResource: .star, text: "10")
}
