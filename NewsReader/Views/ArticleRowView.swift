//
//  ArticleRowView.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let urlString = article.urlToImage, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder:  {
                    Image(systemName: "photo")
                    ProgressView()
                }.frame(width: 40, height: 40)
                    .cornerRadius(8)
            }else{
                Image(systemName: "photo")
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .aspectRatio(contentMode: .fill)
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text(article.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
