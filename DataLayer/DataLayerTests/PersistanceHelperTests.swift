//
//  PersistanceHelperTests.swift
//  DataLayerTests
//
//  Created by Florin Uscatu on 18/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import DataLayer

class PersistanceHelperTests: XCTestCase {
    
    // MARK: - Lifecycle
    override func setUp() {
        super.setUp()
        clearFiles()
    }
    
    // MARK: - Tests
    func test_getPeopleFromDiskWithMissingFile_throwsError() {
        XCTAssertThrowsError(try PersistanceHelper().getPeopleFromDisk())
    }
    
    func test_getPeopleFromDiskWithExistingFile_returnsCorrectPeopleCount() {
        let resourcesToSave: [PersonResource] = [.makeLukeMock(), .makeYodaMock()]
        do {
            try PersistanceHelper().savePeopleToDisk(people: resourcesToSave)
            let retrievedResources = try PersistanceHelper().getPeopleFromDisk()
            XCTAssertEqual(retrievedResources.count, 2)
        } catch {
            XCTFail("Could not access disk")
        }
    }
    
    func test_tryToSaveTheSameEntriesTwice_savesThemOnlyOnce() {
        let resourcesToSave: [PersonResource] = [.makeLukeMock(), .makeYodaMock()]
        do {
            try PersistanceHelper().savePeopleToDisk(people: resourcesToSave)
            try PersistanceHelper().savePeopleToDisk(people: resourcesToSave)
            let retrievedResources = try PersistanceHelper().getPeopleFromDisk()
            XCTAssertEqual(retrievedResources, resourcesToSave)
        } catch {
            XCTFail("Could not access disk")
        }
    }
    
    // MARK: - Private functions
    private func clearFiles() {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        do {
            let fileUrls = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            for fileUrl in fileUrls {
                try FileManager.default.removeItem(at: fileUrl)
            }
        } catch {
            XCTFail("Could not clear folder")
        }
    }
    
}
