//
//  NetworkManager.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation
import Alamofire

public struct NetworkManager {
    
    static let networkUnavailableCode: Double = 1000

    static func makeRequest(_ urlRequest: HTTPRouter, completion: @escaping (Result) -> ()) {
                
        AF.request(urlRequest.url,
                   method: HTTPMethod(rawValue: urlRequest.method.rawValue),
                          parameters: urlRequest.parameters,
                          encoding: urlRequest.encodingType == .json ? JSONEncoding.default : URLEncoding.queryString,
                          headers: urlRequest.headers).responseJSON { responseObject in
                            
            switch responseObject.result {
            case .success(let value):
                debugPrint("URL: \(urlRequest.url)")
              //  debugPrint("Response: \(value)")

                
                if let error = error(fromResponseObject: responseObject) {
                    completion(.failure(error))
                } else {
                    completion(.success(value))
                }
            case .failure(let error):
                completion(.failure(generateError(from: error, with: responseObject)))
            }
        }
    }
    
    //API Successful errors
    static func error(fromResponseObject responseObject: AFDataResponse<Any>) -> Error? {
        if let statusCode = responseObject.response?.statusCode {
            switch statusCode {
            case 200...300: return nil
            default:
                if let result = try? responseObject.result.get() as? [String: Any],
                    let errorMessage = result["error"] as? String {
                    if let code = result["code"] as? Double {
                        return NetworkError.error(code: code, message: errorMessage)
                    } else {
                        return NetworkError.errorString(errorMessage)
                    }
                }
            }
        }
        return NetworkError.generic
    }
    
    //Request failure errors
    static func generateError(from error: Error, with responseObject: AFDataResponse<Any>) -> Error {
        if let statusCode = responseObject.response?.statusCode {
            if let data = responseObject.data, let jsonString = String(data: data, encoding: .utf8) {
                return NetworkError.error(code: Double(statusCode), message: jsonString)
            }
        } else {
            let code = (error as NSError).code
            switch code {
            case NSURLErrorNotConnectedToInternet, NSURLErrorCannotConnectToHost, NSURLErrorCannotFindHost, NSURLErrorTimedOut:
                return NetworkError.error(code: networkUnavailableCode, message: "Network Unavailable")
            default:
                return NetworkError.generic
            }
        }
        return NetworkError.generic
    }
}
