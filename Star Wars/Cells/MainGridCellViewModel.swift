//
//  MainGridCellViewModel.swift
//  Star Wars
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import DataLayer

struct MainGridCellViewModel: Hashable {
    let name: String
    
    static func from(_ person: Person) -> MainGridCellViewModel {
        return MainGridCellViewModel(name: person.name)
    }
}
