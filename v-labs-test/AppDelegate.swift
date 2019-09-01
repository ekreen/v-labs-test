//
//  AppDelegate.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let appDependencies = AppDependencies()
        window = UIWindow(frame: UIScreen.main.bounds)
        let wireframe = RootWireframe(window: window!)
        wireframe.start()
        window?.makeKeyAndVisible()
        return true
    }
}

