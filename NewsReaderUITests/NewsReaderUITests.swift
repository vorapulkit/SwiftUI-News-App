//
//  NewsReaderUITests.swift
//  NewsReaderUITests
//
//  Created by Pulkit Vora on 25/07/24.
//

import XCTest

class NewsReaderUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testBrowseArticles() {
       
    }
}
