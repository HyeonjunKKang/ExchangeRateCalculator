//
//  SceneDelegate.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let networkManager = NetworkManagerModel.shared
        networkManager.fetchData()
        ImageManager.shared.makeFlagData()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}

