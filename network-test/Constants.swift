//
//  Constants.swift
//  network-test
//
//  Created by Jun on 2023/06/22.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    
    struct APIParameterKey {
        static let title = "title"
        static let body = "body"
        static let userId = "userId"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
