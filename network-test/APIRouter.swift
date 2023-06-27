//
//  APIRouter.swift
//  network-test
//
//  Created by Jun on 2023/06/22.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case todos(id: Int)
    case users
    case createPost(title: String, body:String, userId: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .todos:
            return .get
        case .users:
            return .get
        case .createPost:
            return .post
        }
    }
    
    // MARK: - Path
    // MARK: GET요청은 문제없음
    private var path: String {
        switch self {
        case .todos(let id):
            return "/users/\(id)/todos"
        case .users:
            return "/users"
        case .createPost:
            return "/posts"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .todos:
            return nil
        case .users:
            return nil
        case .createPost(let title, let body, let userId):
            return [
                K.APIParameterKey.title: title,
                K.APIParameterKey.body: body,
                K.APIParameterKey.userId: userId
            ]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
