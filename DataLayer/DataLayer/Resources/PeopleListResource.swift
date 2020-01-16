//
//  PeopleListResource.swift
//  DataLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

struct PeopleListResource: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PersonResource]
}
