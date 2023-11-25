//
//  View+.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        if value {
            self
        } else {
            EmptyView()
        }
    }
}
