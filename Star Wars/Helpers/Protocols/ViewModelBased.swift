//
//  ViewModelBased.swift
//  Star Wars
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

protocol ViewModel {}

protocol ViewModelBased: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: Storyboarded & UIViewController {
    static func getInstance(with viewModel: ViewModelType) -> Self {
        let viewController = Self.getInstance()
        viewController.viewModel = viewModel
        return viewController
    }
}
