//
//  UIViewController+Extension.swift
//  Star Wars
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(for error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.view.tintColor = .systemOrange
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
