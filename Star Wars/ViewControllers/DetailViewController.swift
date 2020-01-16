//
//  DetailViewController.swift
//  Star Wars
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

final class DetailViewController: UITableViewController, ViewModelBased {
    
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var heightLabel: UILabel!
    @IBOutlet private(set) weak var weightLabel: UILabel!
    @IBOutlet private(set) weak var genderLabel: UILabel!
    @IBOutlet private(set) weak var eyeColorLabel: UILabel!
    @IBOutlet private(set) weak var skinColorLabel: UILabel!
    @IBOutlet private(set) weak var hairColorLabel: UILabel!
    @IBOutlet private(set) weak var birthYearLabel: UILabel!
    
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
        heightLabel.text = viewModel.heightText
        weightLabel.text = viewModel.weightText
        genderLabel.text = viewModel.gender
        eyeColorLabel.text = viewModel.eyeColor
        skinColorLabel.text = viewModel.skinColor
        hairColorLabel.text = viewModel.hairColor
        birthYearLabel.text = viewModel.birthYear
    }
    
}

extension DetailViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
