//
//  NewsManager.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

typealias CompletionBlock = (_ success: Bool, _ response: Any?) -> Void

struct NewsManager {
    
    static func getAllNews(completion: @escaping CompletionBlock){
        
        let router = NewsRouter.getAllNews
        NetworkManager.makeRequest(router) { result in
            switch result {
            case .success(let value):
                guard let data = value as? [String:Any], let listingNodes = data["data"] as? [String: Any] else {
                    return completion(false, NetworkError.errorString("News parsing error"))
                }
                
                if let articles = parseNewsListingData(listingNodes) {
                    completion(true, articles)
                } else {
                    completion(false, nil)
                }
            case .failure(let error):
                debugPrint(error)
                completion(false, error.localizedDescription)
            }
        }
    }
    
    static func parseNewsListingData(_ node: [String:Any]) -> [Article]? {
        guard let children = node["children"] as? [[String: Any]], !children.isEmpty else { return nil }
        
        var array: [Article] = []
        for anArticle in children {
            guard
                let data = anArticle["data"] as? [String: Any],
                let content = data["selftext"] as? String,
                let title = data["title"] as? String else { continue }
            
            let thumbnailUrl = data["thumbnail"] as? String
            let contentUrl = data["url"] as? String
            let kind = data["kind"] as? String ?? ""
            let thumbnailWidth = data["thumbnail_width"] as? Int
            let thumbnailHeight = data["thumbnail_height"] as? Int
            
            var image:Image? = nil
            if let preview = data["preview"] as? [String: Any], !preview.isEmpty {
                image = parseImageUrl(preview)
            }
            
            let article = Article(title: title, body: content, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, thumbnailUrl: thumbnailUrl, contentUrl: contentUrl, largeImage: image, kind: kind)
            array.append(article)
        }
        return array
    }
    
    static func parseImageUrl(_ data: [String:Any]) -> Image? {
        guard let images = data["images"] as? [[String: Any]], !images.isEmpty,
            let firstItem = images.first, let source = firstItem["source"] as? [String: Any] else {
            return nil
        }
        
        guard let url = source["url"] as? String,
            let width = source["width"] as? Int,
            let height = source["height"] as? Int else { return nil }
        
        return Image(url: url, width: width, height: height)
    }
}
