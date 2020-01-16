//
//  OnlineRepository.swift
//  DataLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import NetworkLayer

public class OnlineRepository: Repository {
    
    private let sessionManager = SessionManager()
    
    public init() {}
    
    public func getPeople(page: Int, completion handler: @escaping (Result<[Person], Error>) -> Void) {
        sessionManager.request(type: PeopleListResource.self, requestType: .people(page: page)) { (result) in
            switch result {
            case .failure(let error):
                handler(Result.failure(error))
            case .success(let resource):
                let people = resource.results.map { Person.from($0) }
                handler(Result.success(people))
            }
        }
    }
}
