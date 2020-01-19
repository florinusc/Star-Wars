//
//  PersistanceHelper.swift
//  DataLayer
//
//  Created by Florin Uscatu on 17/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import Common

final class PersistanceHelper {
    
    private let fileManager = FileManager()
    private let filename = "people.json"
    
    private var url: URL { getCachesDirectory().appendingPathComponent(filename) }
    
    private func getCachesDirectory() -> URL {
        let paths = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0]
    }

    func savePeopleToDisk(people: [PersonResource]) throws {
        let encoder = JSONEncoder()
        var data: Data?
        if let currentPeople = try? getPeopleFromDisk() {
            var newPeople = [PersonResource]()
            for person in people {
                if !currentPeople.contains(where: { $0 == person }) {
                    newPeople.append(person)
                }
            }
            let finalList = currentPeople + newPeople
            data = try encoder.encode(finalList)
            try fileManager.removeItem(at: url)
        } else {
            data = try encoder.encode(people)
        }
        fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
    }

    func getPeopleFromDisk() throws -> [PersonResource] {
        if let data = fileManager.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            let posts = try decoder.decode([PersonResource].self, from: data)
            return posts
        } else {
            throw CustomError.noLocalData
        }
    }
}
