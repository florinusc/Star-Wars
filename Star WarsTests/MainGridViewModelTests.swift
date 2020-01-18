//
//  MainGridViewModelTests.swift
//  Star WarsTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Star_Wars
import DataLayer

class MainGridViewModelTests: XCTestCase {
    
    // MARK: - Tests
    func test_initialNumberOfPeople_isZero() {
        XCTAssertEqual(makeSUT(false).peopleViewModels.count, 0)
    }
    
    func test_getDataWithoutError_errorIsNil() {
        var testableError: Error?
        makeSUT(false).getData { (result) in
            switch result {
            case .failure(let error): testableError = error
            case .success: return
            }
        }
        XCTAssertNil(testableError)
    }
    
    func test_getDataWithError_errorIsNotNil() {
        var testableError: Error?
        makeSUT(true).getData { (result) in
            switch result {
            case .failure(let error): testableError = error
            case .success: return
            }
        }
        XCTAssertNotNil(testableError)
    }
    
    func test_detailViewModelAtValidIndex_isNotNil() {
        let viewModel = makeSUT(false)
        viewModel.getData { _ in }
        XCTAssertNotNil(viewModel.detailViewModel(at: 1))
    }
    
    func test_detailViewModelAtInvalidIndex_isNil() {
        let viewModel = makeSUT(false)
        viewModel.getData { _ in }
        XCTAssertNil(viewModel.detailViewModel(at: 4))
    }
    
    // MARK: - Private functions
    private func makeSUT(_ error: Bool) -> MainGridViewModel {
        return MainGridViewModel(repository: MockRepository(error))
    }
    
}
