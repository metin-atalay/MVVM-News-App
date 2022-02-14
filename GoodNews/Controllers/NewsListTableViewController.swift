//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Metin Atalay on 8.02.2022.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController{
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-01-09&sortBy=publishedAt&apiKey=44e6a6c2fd9f45a4aa4df030016fa685")!
        
        Webservice().getArticles(url: url) { arcticles in
            
            if let arcticles = arcticles {
                self.articleListVM = ArticleListViewModel(articles: arcticles)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath)  as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found ")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
        
        
    }
    
}
