//
//  NetworkError.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case noInternetConnection
    case decodingFailed
    case badRequest
}
