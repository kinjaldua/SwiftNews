//
//  NewsListViewController.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var presenter: NewsListPresenter = NewsListPresenter(delegate: self)
    let showArticleSegue = "showArticleSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 400
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getNews()
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = presenter.articlesArray?[indexPath.row]
        //pass article object in segue
        performSegue(withIdentifier: showArticleSegue, sender: article)

    }
    
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let article = presenter.articlesArray?[indexPath.row], let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as? NewsListCell  else {
            return UITableViewCell()

        }
        cell.configure(with: article)
        return cell
    }
    
}

extension NewsListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showArticleSegue, let nextViewController = segue.destination as? NewsArticleViewController, let article = sender as? Article {
            nextViewController.article = article
        }
    }
}

extension NewsListViewController: NewsListDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
    
}
