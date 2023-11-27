//
//  License.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

struct License: Codable {
    let key, name: String?
    let url: String?
    let spdxID, nodeID: String?
    let htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case key, name, url
        case spdxID = "spdx_id"
        case nodeID = "node_id"
        case htmlURL = "html_url"
    }
}
