//
//  AppDelegate.swift
//  iTinerary
//
//  Created by Ze Lei on 3/12/22.
//
//  Reference: https://www.youtube.com/watch?v=Cd-B5_vkOFs&t=286s&ab_channel=iOSAcademy

import UIKit
import GooglePlaces
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Configures our API key at application launch.
        GMSPlacesClient.provideAPIKey("AIzaSyC_3rpayZT95YOYtGWWBffVJuRRbjpvWu0")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    // core data functions

    func saveContext () {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    

    
    lazy var persistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "iTinerary")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
           
            if let error = error as NSError? {
                fatalError("Unresolved \(error), \(error.userInfo)")
            }
        })
        return container
    } ()

}

