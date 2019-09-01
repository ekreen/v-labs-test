//
//  UserdetailViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit
import RxSwift

class UserdetailViewController: UIViewController {
    
    // MARK: - Properties
    var wireframe: RootWireframe!
    var viewModel: UserdetailViewModel!
    private var albums = [Album]()
    private var posts = [Post]()
    private let disposeBag = DisposeBag()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - private functions
private extension UserdetailViewController {
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        loadAlbums()
        loadPosts()
    }
    
    func loadAlbums() {
        viewModel.albums()
            .subscribe(onSuccess: { [weak self] albums in
                guard let strongSelf = self else { return }
                strongSelf.albums = albums
                strongSelf.tableView.reloadData()
            })
        .disposed(by: disposeBag)
    }
    
    func loadPosts() {
        viewModel.posts()
            .subscribe(onSuccess: { [weak self] posts in
                guard let strongSelf = self else { return }
                strongSelf.posts = posts
                strongSelf.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension UserdetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Albums"
        case 1:
            return "Posts"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return albums.count
        case 1:
            return posts.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.albumsCell.identifier, for: indexPath)
            cell.textLabel?.text = albums[indexPath.row].title
            cell.backgroundColor = .blue
            cell.textLabel?.textColor = .white
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postsCell.identifier, for: indexPath)
            cell.textLabel?.text = posts[indexPath.row].title
            cell.backgroundColor = .brown
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
