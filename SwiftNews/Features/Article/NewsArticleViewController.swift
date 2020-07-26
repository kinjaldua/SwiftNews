//
//  NewsArticleViewController.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit

class NewsArticleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension NewsArticleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //  let article = presenter.articlesArray?[indexPath.row]
        
    }
}

extension NewsArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3//presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let article = presenter.articlesArray?[indexPath.row], let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as? NewsListCell  else {
//            return UITableViewCell()
//
//        }
//        cell.configure(with: article)
//        return cell
        return UITableViewCell()
    }
    
}


