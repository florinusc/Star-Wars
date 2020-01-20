//
//  OnlineRepository.swift
//  DataLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import NetworkLayer
import Network

public final class OnlineRepository: Repository {
    
    private let sessionManager = SessionManager()
    private let persistanceHelper = PersistanceHelper()
    
    public init() {}
    
    private func checkInternetConnection(_ online: @escaping (Bool) -> Void) {
        let pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = { path in
            online(path.status == .satisfied)
            pathMonitor.cancel()
        }
        let queue = DispatchQueue(label: "Monitor")
        pathMonitor.start(queue: queue)
    }
    
    public func getPeople(page: Int, completion handler: @escaping (Result<PeopleList, Error>) -> Void) {
        checkInternetConnection { [weak self] (online) in
            guard let self = self else { return }
            guard online else {
                do {
                    let resources = try self.persistanceHelper.getPeopleFromDisk()
                    let people = resources.map { Person.from($0) }
                    let peopleList = PeopleList(more: false, people: people)
                    handler(Result.success(peopleList))
                } catch let error {
                    handler(Result.failure(error))
                }
                return
            }
            self.sessionManager.request(type: PeopleListResource.self, requestType: .people(page: page)) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    handler(Result.failure(error))
                case .success(let resource):
                    try? self.persistanceHelper.savePeopleToDisk(people: resource.results)
                    let people = resource.results.map { Person.from($0) }
                    let peopleList = PeopleList(more: resource.next != nil, people: people)
                    handler(Result.success(peopleList))
                }
            }
        }
    }
}
