//
//  UsersEndpoint.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation

enum UsersEndpoint: APIEndpoint {
    case list
    case create(CreateUserRequest)

    var path: String {
        switch self {
        case .list:   return "/users"
        case .create: return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list:   return .get
        case .create: return .post
        }
    }

    var body: Data? {
        switch self {
        case .list:
            return nil
        case .create(let request):
            return try? JSONEncoder().encode(request)
        }
    }
}
