//
//  DetailViewModel.swift
//  Star Wars
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import DataLayer

struct DetailViewModel: ViewModel {
    
    // MARK: - Private constants
    private let person: Person
    
    // MARK: - Public variables
    var name: String { return person.name }
    var heightText: String { return "\(person.height) cm" }
    var weightText: String { return "\(person.mass) kg"}
    var eyeColor: String { return person.eyeColor }
    var skinColor: String { return person.skinColor }
    var hairColor: String { return person.hairColor }
    var birthYear: String { return person.birthYear }
    var gender: String { return person.gender }
    
    // MARK: - Lifecycle
    init(person: Person) {
        self.person = person
    }
}
