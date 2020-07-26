//
//  NewsArticlePresenter.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-26.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import Foundation

class NewsArticlePresenter {
    
    var article: Article?
    private weak var delegate: NewsArticleDelegate?
    var rows: [Row] = []
    
    init(delegate: NewsArticleDelegate) {
        self.delegate = delegate
    }
    
    func updateDataSource() {
        guard let article = article else { return }
        rows.removeAll()
        
        rows.append(.title)
        if let _ = article.largeImage {
            rows.append(.image)
        }
        
        if !article.body.isEmpty {
            rows.append(.body)
        }
        
        delegate?.reloadTableView()
    }
    
}

extension NewsArticlePresenter {
    enum Row: Int, CaseIterable {
        case title
        case image
        case body
    }
    
    var numberOfRows: Int {
        return rows.count
    }
    
    func row(for indexPath: IndexPath) -> Row {
        return rows[indexPath.row]
    }
    
}
