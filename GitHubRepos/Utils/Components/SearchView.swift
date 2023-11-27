//
//  SearchView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import SwiftUI

struct SearchView: View {
    var placeholder: String
    var searchAction: ArgumentAction<String>? = nil
    @State private var searchText: String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(.inputSearch)
                .resizable()
                .frame(width: 15, height: 15)
            
            TextField(placeholder, text: $searchText)
                .font(.system(size: 12))
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            Button("Search") {
                searchAction?(searchText)
            }
            .font(.system(size: 14, weight: .medium))
            .disabled(searchText.isEmpty)
            .opacity(searchText.isEmpty ? 0.8 : 1)
            .frame(width: 90, height: 35)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .padding(.vertical, 6)
        .padding(.leading, 15)
        .padding(.trailing, 6)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(searchText.isEmpty ? 0.5 : 1), lineWidth: 0.5)
        )
    }
}

#Preview {
    SearchView(placeholder: "Search for repositories")
        .padding()
}
