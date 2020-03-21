//
//  AppDelegate.swift
//  PatternsLesson
//
//  Created by Ильдар Залялов on 16.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        GMSPlacesClient.provideAPIKey(Constants.apiKey)
                
        let mainController: UIViewController = UINavigationController(rootViewController: LoginAssembly.configureModule())
                
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
        
        return true
    }
}

