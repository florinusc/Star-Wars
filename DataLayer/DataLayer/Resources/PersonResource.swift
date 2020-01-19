//
//  PersonResource.swift
//  DataLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

public struct PersonResource: Codable, Equatable {

    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String    
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass, gender
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
    
}

extension PersonResource {
    public static func makeLukeMock() -> PersonResource {
        return PersonResource(name: "Luke",
                              height: "177",
                              mass: "200",
                              hairColor: "brown",
                              skinColor: "fair",
                              eyeColor: "green",
                              birthYear: "19BBY",
                              gender: "male")
    }
    
    public static func makeYodaMock() -> PersonResource {
        return PersonResource(name: "Yoda",
                              height: "98",
                              mass: "54",
                              hairColor: "n/a",
                              skinColor: "green",
                              eyeColor: "black",
                              birthYear: "1112",
                              gender: "male")
    }
}

