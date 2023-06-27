//
//  APIClient.swift
//  network-test
//
//  Created by Jun on 2023/06/22.
//

import Foundation
import Alamofire

class APIClient {
    static func getTodo(completion:@escaping (Result<[Todo], AFError>)->Void) {
        AF.request(APIRouter.todos)
                 .responseDecodable { (response: DataResponse<[Todo], AFError>) in
            completion(response.result)
        }
    }
    
    static func getUsers(completion: @escaping (Result<[User], AFError>) -> Void){
        AF.request(APIRouter.users).responseDecodable { (response: DataResponse<[User], AFError>) in
            completion(response.result)
        }
    }
    
    static func postArticle(title: String, body: String, userId: Int,completion: @escaping (Result<Post, AFError>) -> Void){
        AF.request(APIRouter.createPost(title: title, body: body, userId: userId)).responseDecodable { (response: DataResponse<Post, AFError>) in
            completion(response.result)
        }
    }
}
