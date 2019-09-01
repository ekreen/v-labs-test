//
//  Router.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

protocol Router {
    var rootController: UINavigationController { get }
    
    func setRootController(controller: UIViewController)
    func pushViewController(controller: UIViewController)
    func popViewController()
}
