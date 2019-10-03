//
//  AppDelegate.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: RootCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupAppearances()
        
        coordinator = RootCoordinator(launchOptions: launchOptions, animated: true)
        
        window = UIWindow()
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        
        coordinator?.start()
        
        return true
    }
    
    private func setupAppearances() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().isTranslucent = false
    }
}
