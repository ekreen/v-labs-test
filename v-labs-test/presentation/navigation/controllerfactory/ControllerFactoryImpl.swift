//
//  ControllerFactoryImpl.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class ControllerFactoryImpl: ControllerFactory {
    func makeUserlistViewController() -> UIViewController {
        return R.storyboard.userlist().instantiateViewController(withIdentifier: R.storyboard.userlist.userlistViewController.identifier)
    }
    
    func makeUserdetailViewController() -> UIViewController {
        return R.storyboard.userdetail().instantiateViewController(withIdentifier: R.storyboard.userdetail.userdetailViewController.identifier)
    }
    
    func makeCreatepostViewController() -> UIViewController {
        return R.storyboard.createpost().instantiateViewController(withIdentifier: R.storyboard.createpost.createpostViewController.identifier)
    }
}
