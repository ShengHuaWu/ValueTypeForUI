//
//  AppDelegate.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.backgroundColor = UIColor.white
        
        let listViewController = ListViewController()
        let navigationController = UINavigationController(rootViewController: listViewController)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

