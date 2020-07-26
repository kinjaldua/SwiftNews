//
//  Article.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

struct Article {
    var title: String
    var body: String
    var thumbnail_width: Int?
    var thumbnail_height: Int?
    var thumbnail_url: String?
    var contentUrl: String?
    var largeImage: Image?
    var kind: String
    
   
}

struct Image {
    
    var url: String?
    var width: Int?
    var height: Int?
}
