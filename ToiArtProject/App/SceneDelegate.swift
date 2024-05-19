//
//  SceneDelegate.swift
//  ToiArtProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        var rootViewController: UIViewController?
        if let savedLanguage = UserDefaults.standard.string(forKey: "AppLanguage"),
           let language = languageType(rawValue: savedLanguage) {
            AppLanguageManager.shared.setApplanguage(language: language)
        }
        if UserDefaults.standard.bool(forKey: "RegisterSnreens") == true {
            rootViewController = ViewController()
        } else {
            rootViewController = StartingViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: rootViewController!)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    
}

