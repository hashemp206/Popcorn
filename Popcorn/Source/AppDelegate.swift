//
//  AppDelegate.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 1: create a new window
        window = UIWindow()
        
        // 2: create root view controller
        let navigationVC = UINavigationController(rootViewController: SearchMoviesViewController())
        
        // 3: assign rootView controller to the window
        window?.rootViewController = navigationVC
        
        return true
    }

}

