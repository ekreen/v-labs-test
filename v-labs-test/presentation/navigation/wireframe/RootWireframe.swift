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
    private var contentRepository: ContentRepository
    private var apiManager: ApiManager
    
    init(window: UIWindow) {
        self.window = window
        self.router = RouterImpl()
        self.controllerFactory = ControllerFactoryImpl()
        self.apiManager = ApiManagerImpl()
        self.contentRepository = ContentRepository(apiManager: apiManager)
    }

    func start() {
        let controller = controllerFactory.makeUserlistViewController() as! UserlistViewController
        controller.wireframe = self
        controller.viewModel = UserlistViewModel(contentRepository: contentRepository)
        router.setRootController(controller: controller)
        window.rootViewController = router.rootController
    }
    
    func showDetail(for user: User) {
        let controller = controllerFactory.makeUserdetailViewController() as! UserdetailViewController
        controller.wireframe = self
        controller.viewModel = UserdetailViewModel(contentRepository: contentRepository, user: user)
        router.pushViewController(controller: controller)
    }
    
}
