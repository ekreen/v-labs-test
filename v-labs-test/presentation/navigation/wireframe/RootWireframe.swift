//
//  RootWireframe.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class RootWireframe {
    private var window: UIWindow
    private var router: Router
    private var appDependencies: AppDependencies
    
    init(window: UIWindow, appDependencies: AppDependencies) {
        self.window = window
        self.router = RouterImpl()
        self.appDependencies = appDependencies
    }

    func start() {
        let controller = appDependencies.controllerFactory.makeUserlistViewController() as! UserlistViewController
        controller.wireframe = self
        controller.viewModel = UserlistViewModel(contentRepository: appDependencies.contentRepository)
        router.setRootController(controller: controller)
        window.rootViewController = router.rootController
    }
    
    func showDetail(for user: User) {
        let controller = appDependencies.controllerFactory.makeUserdetailViewController() as! UserdetailViewController
        controller.wireframe = self
        controller.viewModel = UserdetailViewModel(contentRepository: appDependencies.contentRepository, user: user)
        router.pushViewController(controller: controller)
    }
    
}
