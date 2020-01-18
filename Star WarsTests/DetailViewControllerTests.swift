//
//  DetailViewControllerTests.swift
//  Star WarsTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Star_Wars
import DataLayer

class DetailViewControllerTests: XCTestCase {
    
    // MARK: - Tests
    func test_title_isCorrect() {
        XCTAssertEqual(makeSUT().title, "Luke")
    }
    
    func test_heightLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().heightLabel.text, "177 cm")
    }
    
    func test_weightLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().weightLabel.text, "200 kg")
    }
    
    func test_genderLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().genderLabel.text, "male")
    }
    
    func test_eyeColorLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().eyeColorLabel.text, "green")
    }
    
    func test_skinColorLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().skinColorLabel.text, "fair")
    }
    
    func test_hairColorLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().hairColorLabel.text, "brown")
    }
    
    func test_birthYearLabelText_isCorrect() {
        XCTAssertEqual(makeSUT().birthYearLabel.text, "19BBY")
    }
    
    // MARK: - Private functions
    private func makeSUT() -> DetailViewController {
        let detailViewController = DetailViewController.getInstance(with: DetailViewModel(person: .makeLukeMock()))
        _ = detailViewController.view
        RunLoop.current.run(until: Date())
        return detailViewController
    }
    
}
