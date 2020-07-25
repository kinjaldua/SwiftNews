//
//  NetworkError.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case errorString(String)
    case error(code: Double?, message: String)
    case generic
    
     var errorDescription: String? {
        switch self {
        case .errorString(let errorMessage): return errorMessage
        case .error(_,let message): return message
        case .generic: return "Sorry"
        }
    }
    
    var info: (code: Double?, message: String) {
        switch self {
        case .error(let code, let message):
            return (code, message)
        case .errorString(let errorMessage): return (nil, errorMessage)
        case .generic: return  (nil, "Something went wrong")
        }
    }
    
    var title: String {
        return ""
    }
}
