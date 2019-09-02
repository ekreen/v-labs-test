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
    
    func showUserDetail(for user: User) {
        let controller = appDependencies.controllerFactory.makeUserdetailViewController() as! UserdetailViewController
        controller.wireframe = self
        controller.viewModel = UserdetailViewModel(contentRepository: appDependencies.contentRepository, user: user)
        router.pushViewController(controller: controller)
    }
    
    func showAlbumDetail(for album: Album) {
        let controller = appDependencies.controllerFactory.makeAlbumdetailViewController() as! AlbumdetailViewController
        controller.wireframe = self
        controller.viewModel = AlbumdetailViewModel(contentRepository: appDependencies.contentRepository, album: album)
        router.pushViewController(controller: controller)
    }
    
    func showPostform(for user: User) {
        let controller = appDependencies.controllerFactory.makePostformViewController() as! PostformViewController
        controller.wireframe = self
        controller.viewModel = PostformViewModel(contentRepository: appDependencies.contentRepository, user: user)
        router.present(controller: controller)
    }
    
}
