//
//  Article.swift
//  GoodNews
//
//  Created by Metin Atalay on 9.02.2022.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

