//
//  DetailViewModelTests.swift
//  Star WarsTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Star_Wars
import DataLayer

class DetailViewModelTests: XCTestCase {
    
    // MARK: - Tests
    func test_name_isCorrect() {
        XCTAssertEqual(makeSUT().name, "Luke")
    }
    
    func test_height_isCorrect() {
        XCTAssertEqual(makeSUT().heightText, "177 cm")
    }
    
    func test_weight_isCorrect() {
        XCTAssertEqual(makeSUT().weightText, "200 kg")
    }
    
    func test_eyeColor_isCorrect() {
        XCTAssertEqual(makeSUT().eyeColor, "green")
    }
    
    func test_skinColor_isCorrect() {
        XCTAssertEqual(makeSUT().skinColor, "fair")
    }
    
    func test_hairColor_isCorrect() {
        XCTAssertEqual(makeSUT().hairColor, "brown")
    }
    
    func test_birthYear_isCorrect() {
        XCTAssertEqual(makeSUT().birthYear, "19BBY")
    }
    
    func test_gender_isCorrect() {
        XCTAssertEqual(makeSUT().gender, "male")
    }
    
    // MARK: - Private functions
    private func makeSUT() -> DetailViewModel {
        return DetailViewModel(person: .makeLukeMock())
    }
}
