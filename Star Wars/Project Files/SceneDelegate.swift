//
//  SceneDelegate.swift
//  Star Wars
//
//  Created by Florin Uscatu on 14/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import UIKit
import DataLayer

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureWindow(scene)
    }
    
    private func configureWindow(_ scene: UIScene) {
        var repository: Repository {
            if CommandLine.arguments.contains("--uitesting") {
                return MockRepository()
            }
            return OnlineRepository()
        }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController(rootViewController: MainGridViewController.getInstance(with: MainGridViewModel(repository: repository)))
        navigationController.navigationBar.tintColor = .systemOrange
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

