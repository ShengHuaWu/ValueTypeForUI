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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        window?.backgroundColor = UIColor.whiteColor()
        
        let listViewController = ListViewController()
        let navigationController = UINavigationController(rootViewController: listViewController)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

