//
//  AppDelegate.swift
//  MovieList
//
//  Created by Ferry jati on 14/10/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  let window: UIWindow? = nil
  var navigation: UINavigationController!
 
  lazy var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "MovieListData")
          container.loadPersistentStores(completionHandler: { (_, error) in
              if let error = error {
                  fatalError("Unresolved error \(error)")
              }
          })
          return container
      }()
      
      func saveContext() {
          let context = persistentContainer.viewContext
          if context.hasChanges {
              do {
                  try context.save()
              } catch {
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
      }
  
  
  
  
  
  
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let view = HomeRouter.createHomeModule()
    
    let nc = UINavigationController(rootViewController: view)
    self.window?.rootViewController = nc
    self.window?.makeKeyAndVisible()
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>){
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
}
