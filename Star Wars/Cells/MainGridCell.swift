//
//  MainGridCell.swift
//  Star Wars
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

class MainGridCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public variables
    var viewModel: MainGridCellViewModel! {
        didSet { setup(with: viewModel) }
    }
    
    // MARK: - Private functions
    private func setup(with viewModel: MainGridCellViewModel) {
        nameLabel.text = viewModel.name
    }
}
