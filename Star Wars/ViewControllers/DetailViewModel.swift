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
    
    // MARK: - Lifecycle
    init(person: Person) {
        self.person = person
    }
}
