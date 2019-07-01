//
//  MainViewController.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private let cellNameAndId: String = String(describing: ArticleCell.self)
    
    private let segueIdNewsDetail: String = "showArticleDetail"
    
    private var news = [News]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var articleSelected: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.kSWIFT_NEWS_TITLE
        
        // MARK: Setup the tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: self.cellNameAndId, bundle: nil), forCellReuseIdentifier: self.cellNameAndId)
        
        self.loadNews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ArticleDetailVC else {
            #if DEBUG
                print("Not possible to convert the segue to: \(ArticleDetailVC.self)")
            #endif
            
            return
        }
        
        detailVC.article = self.articleSelected
    }
    
    fileprivate func loadNews() {
        // TODO: remove test data
        self.news = [News(title: "Test 1", description: "test....", thumbnail: "image1"),
                     News(title: "Test 2", description: "test....", thumbnail: "image2")]
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.articleSelected = self.news[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.performSegue(withIdentifier: self.segueIdNewsDetail, sender: self)
    }
}

// MARK: - UITableViewController

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: self.cellNameAndId)
        
        guard let articleCell = rawCell as? ArticleCell else {
            #if DEBUG
                print("Error dequeue Reusable Cell: \(self.cellNameAndId)")
            #endif
            
            return rawCell!
        }
        
        articleCell.fillCell(article: self.news[indexPath.row])
        
        return articleCell
    }
}
