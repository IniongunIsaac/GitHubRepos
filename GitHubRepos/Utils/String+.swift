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
    
    func dateFormatted(
        from fromFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'",
        using toFormat: String = "dd/mm/yyyy"
    ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            return dateFormatter.string(from: date)
        } else {
            return "--"
        }
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
