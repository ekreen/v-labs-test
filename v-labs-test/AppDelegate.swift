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
    var wireframe: RootWireframe?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        wireframe = RootWireframe(window: window!, appDependencies: AppDependenciesImpl())
        wireframe!.start()
        window?.makeKeyAndVisible()
        return true
    }
}

