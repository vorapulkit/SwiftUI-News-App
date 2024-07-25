//
//  FetchNewsByCompanyests.swift
//  NewsReaderTests
//
//  Created by Pulkit Vora on 25/07/24.
//

import XCTest
@testable import NewsReader

final class FetchNewsByCompanyTests: XCTestCase {

    var viewModel: NewsViewModel!

        override func setUpWithError() throws {
            viewModel = NewsViewModel()
        }

        override func tearDownWithError() throws {
            viewModel = nil
        }

        func testFetchNewsByCompany() {
            let expectation = self.expectation(description: "Fetch news articles for different companies")
            let companies = ["apple", "microsfot", "yahoo", "google"]
            var fetchCount = 0

            companies.forEach { company in
                viewModel.selectedCompany = company
                viewModel.fetchNews()
                
                NetworkManager.shared.fetchNews(company: company) { result in
                    switch result {
                    case .success(let articles):
                        XCTAssertFalse(articles.isEmpty, "Articles should be fetched for company \(company)")
                    case .failure(let error):
                        XCTFail("Error fetching news for company \(company): \(error)")
                    }
                    
                    fetchCount += 1
                    if fetchCount == companies.count {
                        expectation.fulfill()
                    }
                }
            }
            
            waitForExpectations(timeout: 30, handler: nil)
        }

}
