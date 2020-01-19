//
//  Star_WarsUITests.swift
//  Star WarsUITests
//
//  Created by Florin Uscatu on 14/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest

class Star_WarsUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func test_openingCorrectDetailScreen_afterMainGridCellTap() {
        app.launch()
        XCTAssertTrue(app.otherElements["mainGrid"].exists)
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["Luke"].exists)
    }
   
}
