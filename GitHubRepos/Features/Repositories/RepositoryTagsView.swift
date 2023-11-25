//
//  RepositoryTagsView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

let tags = ["material design", "components", "tags", "doings", "greatness"]

struct RepositoryTagsView: View {
    var tags: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    PillView(text: tag)
                }
            }
        }
        .frame(height: 40)
    }
}

#Preview {
    RepositoryTagsView(tags: tags)
        .padding()
}
