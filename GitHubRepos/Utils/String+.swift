//
//  String+.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

extension String {
    func insensitiveEquals(_ value: String) -> Bool {
        localizedCaseInsensitiveCompare(value) == .orderedSame
    }
    
    func insensitiveNotEquals(_ value: String) -> Bool {
        localizedCaseInsensitiveCompare(value) != .orderedSame
    }
    
    func insensitiveContains(_ value: String) -> Bool {
        lowercased().localizedCaseInsensitiveContains(value.lowercased())
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
