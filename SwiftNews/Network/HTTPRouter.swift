//
//  HTTPRouter.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

import Alamofire

enum Encoding {
    case json
    case url
}

enum HttpMethod : String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

protocol HTTPRouter {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var parameters: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
    var encodingType: Encoding { get }
    var request: URLRequest { get }
}

extension HTTPRouter {
    
    var baseURL: String {
        return "https://www.reddit.com"
    }
    
    var url: URL {
        return URL(string: baseURL + path)!
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String]? {
        return nil
    }
    
    var encodingType: Encoding {
        return .json
    }
    
    var request: URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return urlRequest
    }
    
}
