//
//  Todo.swift
//  network-test
//
//  Created by Jun on 2023/06/22.
//

import Foundation
// MARK: 타입에러가 발생했으면 앱이 종료되어야하나?

// MARK: nested User Model -> Get에서 문제없음
struct User: Codable{
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable{
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Coordinate
}

struct Coordinate: Codable{
    let lat: String
    let lng: String
}

struct Company: Codable{
    let name: String
    let catchPhrase: String
    let bs: String
}


// MARK: Todo Model
struct Todo: Codable{
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey{
        case userId
        case id
        case title
        case completed
    }
}

// MARK: Post요청 전용 Post모델
struct Post: Codable{
    let title: String
    let body: String
    let userId: Int
}
