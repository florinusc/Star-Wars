//
//  MainGridViewModel.swift
//  Star Wars
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import DataLayer

final class MainGridViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository
    
    // MARK: - Public variables
    private(set) var peopleViewModels = [MainGridCellViewModel]()
    
    // MARK: - Private variables
    private var people = [Person]()
    private var currentPage = 1
    private var more = true
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getData(_ handler: @escaping (Result<[MainGridCellViewModel], Error>) -> Void) {
        guard more else {
            handler(Result.success([]))
            return
        }
        repository.getPeople(page: currentPage) { (result) in
            switch result {
            case .failure(let error):
                handler(Result.failure(error))
            case .success(let peopleList):
                self.currentPage += 1
                self.more = peopleList.more
                self.people.append(contentsOf: peopleList.people)
                handler(Result.success(peopleList.people.map { MainGridCellViewModel.from($0) }))
            }
        }
    }
    
    func detailViewModel(at index: Int) -> DetailViewModel? {
        guard index >= 0, index < people.count else { return nil }
        return DetailViewModel(person: people[index])
    }
}
