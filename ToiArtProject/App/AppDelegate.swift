//
//  AppDelegate.swift
//  ToiArtProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit
import FirebaseCore
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    lazy var persistentContainers: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Note")
        container.loadPersistentStores(completionHandler: { description, error in
            if let error {
                print(error.localizedDescription)
            } else {
                
            }
        })
        return container
    }()
    
    
    func saveContext() {
        let context = persistentContainers.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as! Error
                fatalError(error.localizedDescription)
                
            }
        }
    }
}
