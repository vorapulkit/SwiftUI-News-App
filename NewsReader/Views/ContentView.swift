//
//  ContentView.swift
//  NewsReader
//
//  Created by Pulkit Vora on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                } else {
                    ProgressView().hidden()
                }
                VStack {
                    Picker("Company", selection: $viewModel.selectedCompany) {
                        ForEach(["apple", "microsoft", "yahoo", "google", "amazon"], id: \.self) {
                            Text($0.capitalized)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: viewModel.selectedCompany, perform: { _ in
                        viewModel.fetchNews()
                    })
                    List {
                        ForEach(viewModel.articles, id: \.title) { article in
                            NavigationLink(destination: ArticleDetailView(article: article, viewModel: viewModel)) {
                                ArticleRowView(article: article)
                            }
                        }
                    }
                    
                }
                .navigationTitle("Coding Assignment")
                .navigationBarTitleDisplayMode(.automatic)
                
            }
        }
    }
}

