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
    
    var body: some View {
        HStack(spacing: 4) {
            Image(imageResource)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(text)
                .font(.body)
        }
    }
}

#Preview {
    IconLabelView(imageResource: .star, text: "10")
}
