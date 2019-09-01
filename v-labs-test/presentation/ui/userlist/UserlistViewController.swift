//
//  UserlistViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit
import RxSwift

class UserlistViewController: UITableViewController {
    
    // MARK: - Properties
    var wireframe: RootWireframe!
    var viewModel: UserlistViewModel!
    private var userList = [User]()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.userListCell.identifier, for: indexPath)

        cell.textLabel?.text = userList[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        wireframe.showDetail(for: userList[indexPath.row])
    }

}

// MARK: - private functions
private extension UserlistViewController {
    
    func loadUsers() {
        viewModel.usersList()
            .subscribe(onSuccess: { [weak self] users in
                guard let strongSelf = self else { return }
                strongSelf.userList = users
                strongSelf.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}
