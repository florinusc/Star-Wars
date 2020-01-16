//
//  DetailViewController.swift
//  Star Wars
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, ViewModelBased {
    
    // MARK: - Public variables
    var viewModel: DetailViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        title = viewModel.name
    }
    
}

extension DetailViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
