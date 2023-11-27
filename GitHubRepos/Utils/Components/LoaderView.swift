//
//  LoaderView.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import SwiftUI

struct LoaderView: View {
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 150, height: 4)
                .cornerRadius(2)
                .offset(x: isLoading ? 200 : -200)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear {
                    isLoading = true
                }
        }
        //.frame(width: 250, height: 50)
    }
}

#Preview {
    LoaderView()
}
