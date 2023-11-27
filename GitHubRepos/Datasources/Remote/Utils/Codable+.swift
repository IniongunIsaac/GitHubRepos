//
//  Codable+.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

typealias Parameters = [String: Any]

extension Data {
    func decode<T: Decodable>(into objectType: T.Type) throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
    
    func prettyJson() throws -> String {
        let jsonObject = try JSONSerialization.jsonObject(with: self, options: [])
        let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
        
        return String(data: prettyJsonData, encoding: .utf8) ?? "--unable--to--get--prettyJson--"
    }
}

extension Encodable {
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
    
    var prettyJson: String {
        if let responseData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) {
            return String(data: responseData, encoding: .utf8) ?? ""
        }
        return ""
    }
}

extension Dictionary {
    var prettyJson: String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) {
            return String(data: jsonData, encoding: .ascii) ?? ""
        }
        return ""
    }
    
    var data: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: [])
    }
}
