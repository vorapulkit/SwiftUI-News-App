//
//  ArticleDetailView.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    let viewModel: NewsViewModel
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            if let urlString = article.urlToImage, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.aspectRatio(contentMode: .fit)
            }
            Text(article.title)
                .font(.largeTitle)
                .padding()
            Text(article.description ?? "")
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: handleButtonAction) {
            if isActive {
                Image(systemName: "bookmark.fill")
            } else {
                Image(systemName: "bookmark")
            }
        })
        .onAppear(perform: {
            isActive = viewModel.bookmarkedArticles.contains { $0.title == article.title}
        })

    }
    
    private func handleButtonAction() {
        // Perform action based on the state
        isActive = !isActive
        if !isActive {
            viewModel.removeBookmarkArticle(article)
        } else {
            viewModel.bookmarkArticle(article)
        }
    }
}
