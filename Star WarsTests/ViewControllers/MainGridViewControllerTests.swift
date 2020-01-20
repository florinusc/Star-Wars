//
//  MainGridViewControllerTests.swift
//  Star WarsTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Star_Wars
import DataLayer

class MainGridViewControllerTests: XCTestCase {
    
    // MARK: - Tests
    func test_viewControllerHasCollectionView_collectionViewIsNotNil() {
        XCTAssertNotNil(makeSUT().collectionView)
    }
    
    func test_collectionViewDelegate_isViewController() {
        XCTAssertTrue(makeSUT().collectionView.delegate is MainGridViewController)
    }
    
    func test_collectionViewDataSource_isNotNil() {
        XCTAssertNotNil(makeSUT().collectionView.dataSource)
    }
    
    // MARK: - Private functions
    private func makeSUT() -> MainGridViewController {
        let mainGridViewController = MainGridViewController.getInstance(with: MainGridViewModel(repository: MockRepository()))
        _ = mainGridViewController.view
        RunLoop.current.run(until: Date())
        return mainGridViewController
    }
}
