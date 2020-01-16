//
//  Person.swift
//  Star Wars
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

public struct Person {
    public let name: String
    public let height: Int
    public let mass: Int
    public let hairColor: String
    public let skinColor: String
    public let eyeColor: String
    public let birthYear: String
    public let gender: String
    
    public static func from(_ resource: PersonResource) -> Person {
        return Person(name: resource.name,
                      height: Int(resource.height) ?? 0,
                      mass: Int(resource.mass) ?? 0,
                      hairColor: resource.hairColor,
                      skinColor: resource.skinColor,
                      eyeColor: resource.eyeColor,
                      birthYear: resource.birthYear,
                      gender: resource.gender)
    }
    
}
