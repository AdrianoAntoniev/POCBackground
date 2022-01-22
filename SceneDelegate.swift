//
//  SceneDelegate.swift
//  POC
//
//  Created by Adriano Rodrigues Vieira on 21/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let vc = ViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        vc.exitBG()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        vc.enterBG()
    }
}

