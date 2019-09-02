//
//  ControllerFactoryImpl.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class ControllerFactoryImpl: ControllerFactory {
    func makeAlbumdetailViewController() -> UIViewController {
        return R.storyboard.albumdetail().instantiateViewController(withIdentifier: R.storyboard.albumdetail.albumdetailViewController.identifier)
    }
    
    func makeUserlistViewController() -> UIViewController {
        return R.storyboard.userlist().instantiateViewController(withIdentifier: R.storyboard.userlist.userlistViewController.identifier)
    }
    
    func makeUserdetailViewController() -> UIViewController {
        return R.storyboard.userdetail().instantiateViewController(withIdentifier: R.storyboard.userdetail.userdetailViewController.identifier)
    }
    
    func makePostformViewController() -> UIViewController {
        return PostformViewController()
    }
}
