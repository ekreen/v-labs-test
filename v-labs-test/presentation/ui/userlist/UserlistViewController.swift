//
//  UserlistViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class UserlistViewController: UIViewController {
    
    var wireframe: RootWireframe!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showUserDetail(_ sender: UIButton) {
        wireframe.showDetail(for: 1)
    }
}
