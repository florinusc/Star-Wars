//
//  CommonTests.swift
//  CommonTests
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Common

class CustomErrorTests: XCTestCase {

    func test_generalErrorDescription_isCorrect() {
        XCTAssertEqual(CustomError.general.localizedDescription, "Something went wrong")
    }
    
    func test_networkErrorDescription_isCorrect() {
        XCTAssertEqual(CustomError.network.localizedDescription, "There was a problem with the network")
    }
    
    func test_noLocalDataErrorDescription_isCorrect() {
        XCTAssertEqual(CustomError.noLocalData.localizedDescription, "There is no local data")
    }

}
