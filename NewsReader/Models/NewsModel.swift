//
//  News.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import Foundation
struct NewsModel: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let id: Int?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}
