//
//  UserdetailViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit
import RxSwift

class UserdetailViewController: UITableViewController {

    // MARK: - Properties
    var wireframe: RootWireframe!
    var viewModel: UserdetailViewModel!
    private var albums = [Album]()
    private var posts = [Post]()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return albums.count
        case 2:
            return posts.count
        default:
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.userInfoCell.identifier, for: indexPath) as! UserinfoTableViewCell
            cell.populate(with: viewModel.user)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.albumCell.identifier, for: indexPath)
            cell.textLabel?.text = "💽 \(albums[indexPath.row].title)"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.albumCell.identifier, for: indexPath)
            cell.textLabel?.text = "💬 \(posts[indexPath.row].title)"
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Albums"
        case 2:
            return "Posts"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        wireframe.showAlbumDetail(for: albums[indexPath.row])
    }
}


// MARK: - private functions
private extension UserdetailViewController {
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.user.username
        
        loadDatas()
    }
    
    func loadDatas() {
        Single.zip(viewModel.albums(), viewModel.posts()) {
            return (albums: $0, posts: $1)
            }
            .subscribe(onSuccess: { [weak self] datas in
                
                guard let strongSelf = self else { return }
                strongSelf.albums = datas.albums
                strongSelf.posts = datas.posts
                strongSelf.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
}
