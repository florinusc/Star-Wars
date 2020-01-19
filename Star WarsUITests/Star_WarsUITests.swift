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
        app.launch()
    }
    
    func test_correctNamesAppearInCells_inMainGrid() {
        XCTAssertTrue(app.collectionViews.cells.element(boundBy: 0).staticTexts["Luke"].exists)
        XCTAssertTrue(app.collectionViews.cells.element(boundBy: 1).staticTexts["Yoda"].exists)
    }
    
    func test_mainGridViewAppears_inMainGridScreen() {
        XCTAssertTrue(app.otherElements["mainGrid"].exists)
    }
    
    func test_openingCorrectDetailScreen_afterMainGridCellTap() {
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["Luke"].exists)
    }
    
    func test_correctDetailsAppearInDetailScreen_afterMainGridCellTap() {
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertEqual(app.staticTexts["heightLabel"].label, "177 cm")
        XCTAssertEqual(app.staticTexts["weightLabel"].label, "200 kg")
        XCTAssertEqual(app.staticTexts["eyeColorLabel"].label, "green")
        XCTAssertEqual(app.staticTexts["skinColorLabel"].label, "fair")
        XCTAssertEqual(app.staticTexts["birthYearLabel"].label, "19BBY")
        XCTAssertEqual(app.staticTexts["hairColorLabel"].label, "brown")
        XCTAssertEqual(app.staticTexts["genderLabel"].label, "male")
    }
   
}
