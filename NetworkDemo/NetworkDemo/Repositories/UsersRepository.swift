//
//  UsersRepository.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation

protocol UsersRepositoryProtocol {
    func fetchUsers() async throws -> [User]
    func createUser(name: String, email: String) async throws -> User
}

final class UsersRepository: UsersRepositoryProtocol {

    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func fetchUsers() async throws -> [User] {
        try await apiService.fetch(UsersEndpoint.list)
    }

    func createUser(name: String, email: String) async throws -> User {
        let request = CreateUserRequest(name: name, email: email)
        return try await apiService.fetch(UsersEndpoint.create(request))
    }
}


