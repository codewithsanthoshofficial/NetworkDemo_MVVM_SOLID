//
//  User.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation


// Response — what server returns
struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

// Request — what you send to create a user
struct CreateUserRequest: Encodable {
    let name: String
    let email: String
}
