//
//  APIService.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
}

final class APIService: APIServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = endpoint.body
        //        if let token = AppConfig.authToken {
        //                    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        //                }
        
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
        
        guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}



/*
 Usage looks identical either way:
 let order: Order = try await apiService.fetch(OrdersEndpoint.detail(id: "123"))
 let user: User = try await apiService.fetch(UsersEndpoint.profile(id: "42"))
 */
