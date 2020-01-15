//
//  ViewController.swift
//  Star Wars
//
//  Created by Florin Uscatu on 14/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

class MainGridViewController: UIViewController, ViewModelBased {

    // MARK: - Public variables
    var viewModel: MainGridViewModel!
}

extension MainGridViewController: Storyboarded {
    static var storyboardName: String { return "Main" }
}
