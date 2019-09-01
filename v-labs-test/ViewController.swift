//
//  ViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let manager = ApiManagerImpl()
        
        manager.getUsers().subscribe(onSuccess: { users in
            print(users)
        })
            .disposed(by: disposeBag)
        
        manager.getAlbums(for: 1).subscribe(onSuccess: { albums in
            print(albums)
        })
            .disposed(by: disposeBag)
        
        manager.getPosts(for: 1).subscribe(onSuccess: { posts in
            print(posts)
        })
            .disposed(by: disposeBag)
    }


}

