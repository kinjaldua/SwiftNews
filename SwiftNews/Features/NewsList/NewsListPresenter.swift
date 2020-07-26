//
//  NewsListPresenter.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-26.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

class NewsListPresenter {
   
    private var delegate: NewsListDelegate?
    var articlesArray: [Article]?
    
    init(delegate: NewsListDelegate) {
        self.delegate = delegate
    }
    
    func getNews(){
        NewsManager.getAllNews { [weak self]  (result, data) in
            guard let data = data as? [Article], let strongSelf = self else { return }
            strongSelf.articlesArray = data
            strongSelf.delegate?.reloadTableView()
        }
    }
    
    var numberOfRows: Int {
        guard let articleArray = articlesArray, !articleArray.isEmpty else {
            return 0
        }
        return articleArray.count
    }
    
}
