//
//  UsersViewModel.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation
import Combine

@MainActor
final class UsersViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let repository: UsersRepositoryProtocol

    init(repository: UsersRepositoryProtocol? = nil) {
        self.repository = repository ?? UsersRepository()
    }

    func loadUsers() async {
        isLoading = true
        errorMessage = nil
        do {
            users = try await repository.fetchUsers()
        } catch {
            errorMessage = (error as? NetworkError)?.errorDescription ?? "Something went wrong."
        }
        isLoading = false
    }

    func addUser(name: String, email: String) async {
        do {
            let newUser = try await repository.createUser(name: name, email: email)
            users.append(newUser)
        } catch {
            errorMessage = (error as? NetworkError)?.errorDescription ?? "Something went wrong."
        }
    }
}
