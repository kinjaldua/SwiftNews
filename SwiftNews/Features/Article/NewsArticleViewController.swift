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

    lazy var presenter = NewsArticlePresenter(delegate: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.updateDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}

extension NewsArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = presenter.row(for: indexPath)
        switch row {
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTitleCell", for: indexPath) as! ArticleTitleCell
            cell.configure(presenter.article?.title ?? "")
            return cell
        case .body:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleBodyCell", for: indexPath) as! ArticleBodyCell
            cell.configure(with: presenter.article)
            return cell

        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleImageCell", for: indexPath) as! ArticleImageCell
            cell.configure(presenter.article)
            return cell

        }
    }
    
}

extension NewsArticleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension NewsArticleViewController : NewsArticleDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}

