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
    var thumbnailWidth: Int?
    var thumbnailHeight: Int?
    var thumbnailUrl: String?
    var contentUrl: String?
    var largeImage: Image?
    var kind: String
    
   
}

struct Image {
    
    var url: String?
    var width: Int?
    var height: Int?
}
