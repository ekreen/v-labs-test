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
    private var controllerFactory: ControllerFactory
    
    init(window: UIWindow) {
        self.window = window
        self.router = RouterImpl()
        self.controllerFactory = ControllerFactoryImpl()
    }

    func start() {
        let controller = controllerFactory.makeUserlistViewController() as! UserlistViewController
        controller.wireframe = self
        router.setRootController(controller: controller)
        window.rootViewController = router.rootController
    }
    
    func showDetail(for userId: Int) {
        let controller = controllerFactory.makeUserdetailViewController(for: userId) as! UserdetailViewController
        controller.wireframe = self
        router.pushViewController(controller: controller)
    }
    
}
