//
//  NewsRouter.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation
import Alamofire

enum NewsRouter: HTTPRouter {
    
    case getAllNews
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var path: String {
        switch self {
        case .getAllNews: return "/r/swift/.json"
        }
    }
    
    var method: HttpMethod {
        return .get
    }
    
}
