//
//  NewsViewModel.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import Foundation
import SwiftUI
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var bookmarkedArticles: [Article] = []
    @Published var selectedCompany: String = "apple"
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        articles.removeAll()
        isLoading = true
        NetworkManager.shared.fetchNews(company: selectedCompany) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
            self!.isLoading = false
        }
    }
    
    func bookmarkArticle(_ article: Article) {           
        if !bookmarkedArticles.contains(where: { $0.title == article.title }) {
            bookmarkedArticles.append(article)
        }
    }
    
    func removeBookmarkArticle(_ article: Article) {
        bookmarkedArticles.removeAll { $0.title == article.title }
    }
    var bookmarkedArticlesView: some View {
        List {
            ForEach(bookmarkedArticles, id: \.title) { article in
                NavigationLink(destination: ArticleDetailView(article: article, viewModel: self)) {
                    ArticleRowView(article: article)
                }
            }
        }
    }
}
