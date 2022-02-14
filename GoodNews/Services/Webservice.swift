//
//  Webservice.swift
//  GoodNews
//
//  Created by Metin Atalay on 8.02.2022.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if articleList != nil {
                    completion(articleList?.articles)
                }
                
            }
            
        }.resume()
        
    }
    
}
