//
//  MockRepository.swift
//  DataLayer
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import Common

public final class MockRepository: Repository {
    
    private let shouldReturnError: Bool
    
    public init(_ shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    public func getPeople(page: Int, completion handler: @escaping (Result<PeopleList, Error>) -> Void) {
        if shouldReturnError {
            handler(Result.failure(CustomError.general))
            return
        }
        let people = [Person(name: "Luke",
                             height: 177,
                             mass: 200,
                             hairColor: "brown",
                             skinColor: "fair",
                             eyeColor: "green",
                             birthYear: "19BBY",
                             gender: "male"),
                      Person(name: "Yoda",
                             height: 98,
                             mass: 54,
                             hairColor: "n/a",
                             skinColor: "green",
                             eyeColor: "black",
                             birthYear: "1112",
                             gender: "male")]
        handler(Result.success(PeopleList(more: false, people: people)))
    }
}
