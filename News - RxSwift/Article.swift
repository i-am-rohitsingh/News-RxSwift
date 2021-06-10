//
//  Article.swift
//  News - RxSwift
//
//  Created by Rohit Kumar on 11/06/21.
//

import Foundation


struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList{
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=ab018b01c3444a1387d38fbb89396ad6")!
        return Resource(url: url)
    }()
}


struct Article: Decodable{
    let title: String
    let description: String?
}
