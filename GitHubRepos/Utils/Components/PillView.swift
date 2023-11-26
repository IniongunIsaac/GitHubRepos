//
//  PillView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct PillView: View {
    var text: String
    var font: Font = .system(size: 14, weight: .semibold)
    var textColor: Color = "#408AAA".color
    var bgColor: Color = "#E8F9FF".color
    var hPadding: CGFloat = 12
    var vPadding: CGFloat = 8
    var radius: CGFloat = 5
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(font)
            .padding(.vertical, vPadding)
            .padding(.horizontal, hPadding)
            .background(bgColor)
            .cornerRadius(radius)
    }
}

#Preview {
    PillView(text: "material design")
}
