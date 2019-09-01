//
//  RouterImpl.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class RouterImpl: Router {
    var rootController: UINavigationController
    
    init(rootController: UINavigationController = UINavigationController()) {
        self.rootController = rootController
    }
    
    func setRootController(controller: UIViewController) {
        rootController.setViewControllers([controller], animated: false)
    }
    
    func pushViewController(controller: UIViewController) {
        rootController.pushViewController(controller, animated: true)
    }
    
    func popViewController() {
        rootController.popViewController(animated: true)
    }
}
