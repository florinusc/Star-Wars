//
//  Repository.swift
//  DataLayer
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

public protocol Repository {
    func getPeople(completion handler: (Result<[Person], Error>) -> Void)
}
