//
//  NetworkManager.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "969bb2faed624b58b26771348d51583b"
    
    func fetchNews(company: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = "https://newsapi.org/v2/everything"
        let parameters: [String: String] = ["q": company, "from":"2024-06-25","apiKey": apiKey]
        
        AF.request(url, parameters: parameters).responseDecodable(of: NewsModel.self) { response in
            switch response.result {
            case .success(let newsResponse):
                completion(.success(newsResponse.articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
