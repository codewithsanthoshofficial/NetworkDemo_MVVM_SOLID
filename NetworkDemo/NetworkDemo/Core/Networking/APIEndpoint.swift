//
//  Endpoint.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import Foundation


protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
}

extension APIEndpoint {
    var body: Data? { nil }   // most GETs don't need to override this

    var url: URL? {
        URL(string: AppConfig.baseURL + path)
    }
}

