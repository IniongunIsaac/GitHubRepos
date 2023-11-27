//
//  IconLabelView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct IconLabelView: View {
    var imageResource: ImageResource
    var imageWidth: CGFloat = 12
    var imageHeight: CGFloat = 12
    var text: String
    var font: Font = .system(size: 12, weight: .regular)
    var spacing: CGFloat = 4
    
    var body: some View {
        HStack(spacing: spacing) {
            Image(imageResource)
                .resizable()
                .scaledToFit()
                .frame(width: imageWidth, height: imageHeight)
            
            Text(text)
                .font(font)
        }
    }
}

#Preview {
    IconLabelView(imageResource: .star, text: "10")
}
