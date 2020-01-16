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
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getData(_ handler: (Error?) -> Void) {
        repository.getPeople { (result) in
            switch result {
            case .failure(let error):
                handler(error)
            case .success(let people):
                self.people = people
                peopleViewModels = people.map { MainGridCellViewModel.from($0) }
                handler(nil)
            }
        }
    }
    
    func detailViewModel(at index: Int) -> DetailViewModel? {
        guard index >= 0, index < people.count else { return nil }
        return DetailViewModel(person: people[index])
    }
}
