//
//  PillView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct PillView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor("#408AAA".color)
            .font(.system(size: 14, weight: .semibold))
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background("#E8F9FF".color)
            .cornerRadius(5)
    }
}

#Preview {
    PillView(text: "material design")
}
