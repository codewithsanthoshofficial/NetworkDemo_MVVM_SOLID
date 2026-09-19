//
//  NetworkError.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case requestFailed(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .invalidResponse: return "Invalid server response."
        case .decodingFailed: return "Failed to read data."
        case .requestFailed(let msg): return msg
        }
    }
}





