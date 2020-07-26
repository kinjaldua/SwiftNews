//
//  NewsListViewController.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-25.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    @IBOutlet weak var emptyStateView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    lazy var presenter: NewsListPresenter = NewsListPresenter(delegate: self)
    let showArticleSegue = "showArticleSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 400
        emptyStateView.isHidden = true
        presenter.getNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = presenter.articlesArray?[indexPath.row] {
            showFullArticle(article)
        }
    }
    
    func showFullArticle(_ article: Article?){
         let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "NewsArticleNavigationController") as! UINavigationController
         if let newsArticleViewController = navigationController.topViewController as? NewsArticleViewController {
            newsArticleViewController.article = article
            newsArticleViewController.presenter.article = article
            show(newsArticleViewController, sender: nil)
         }
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

extension NewsListViewController: NewsListDelegate {
    func showEmptyView() {
        hideLoader()
        tableView.isHidden = true
        emptyStateView.isHidden = false
    }
    
    func reloadTableView() {
        emptyStateView.isHidden = true
        tableView.isHidden = false
        hideLoader()
        tableView.reloadData()
    }
    func showLoader() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func hideLoader()  {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
}

extension NewsListViewController {
    @IBAction func reloadButtonTapped(_ sender: UIButton) {
        presenter.getNews()
    }
}
