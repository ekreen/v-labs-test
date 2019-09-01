//
//  ControllerFactory.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

protocol ControllerFactory {
    func makeUserlistViewController() -> UIViewController
    func makeUserdetailViewController(for userId: Int) -> UIViewController
    func makeCreatepostViewController() -> UIViewController
}