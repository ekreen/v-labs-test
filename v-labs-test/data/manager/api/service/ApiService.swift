//
//  ApiService.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import Moya

enum ApiService {
    case users
    case albums(userId: Int)
    case posts(userId: Int)
}

extension ApiService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .users:
            return "/users"
        case .albums:
            return "/albums"
        case .posts:
            return "/posts"
        }
    }
    
    var method: Method {
        switch self {
        case .users,.albums, .posts:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .users:
            return .requestPlain
        case .albums(let id), .posts(let id):
            return .requestParameters(parameters: ["userId": id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
