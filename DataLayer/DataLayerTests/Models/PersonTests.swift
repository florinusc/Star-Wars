//
//  PersonTests.swift
//  DataLayerTests
//
//  Created by Florin Uscatu on 20/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import DataLayer

class PersonTests: XCTestCase {
    
    func test_personCreationFromResource_propertiesAreCorrect() {
        let person = Person.from(.makeLukeMock())
        XCTAssertEqual(person.name, "Luke")
        XCTAssertEqual(person.gender, "male")
        XCTAssertEqual(person.birthYear, "19BBY")
        XCTAssertEqual(person.eyeColor, "green")
        XCTAssertEqual(person.skinColor, "fair")
        XCTAssertEqual(person.hairColor, "brown")
        XCTAssertEqual(person.mass, 200)
        XCTAssertEqual(person.height, 177)
    }
    
}
