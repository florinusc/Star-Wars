//
//  MockRepositoryTests.swift
//  DataLayerTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import DataLayer

class MockRepositoryTests: XCTestCase {
    
    func test_getPeopleWithErrorReturnsError_errorIsNotNil() {
        var testableError: Error?
        makeSUT(true).getPeople(page: 0) { (result) in
            switch result {
            case .failure(let error): testableError = error
            case .success: XCTFail("Should return error")
            }
        }
        XCTAssertNotNil(testableError)
    }
    
    func test_getPeopleWithoutError_errorIsNil() {
        var testableError: Error?
        var testableResource: PeopleList?
        makeSUT().getPeople(page: 0) { (result) in
            switch result {
            case .failure(let error): testableError = error
            case .success(let resource): testableResource = resource
            }
        }
        XCTAssertNil(testableError)
        XCTAssertNotNil(testableResource)
        XCTAssertEqual(testableResource?.people.count, 2)
    }
    
    func test_getPeopleWithoutError_peopleCountIsCorrect() {
        var testableResource: PeopleList?
        makeSUT().getPeople(page: 0) { (result) in
            switch result {
            case .failure: XCTFail("Should not return error")
            case .success(let resource): testableResource = resource
            }
        }
        XCTAssertEqual(testableResource?.people.count, 2)
    }
    
    // MARK: - Private functions
    private func makeSUT(_ withError: Bool = false) -> MockRepository {
        return MockRepository(withError)
    }
    
}
