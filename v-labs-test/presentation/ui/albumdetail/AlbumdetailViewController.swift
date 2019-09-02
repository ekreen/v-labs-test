//
//  AlbumdetailViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

private let reuseIdentifier = R.reuseIdentifier.photoAlbumCell.identifier

class AlbumdetailViewController: UICollectionViewController {

    // MARK: - Properties
    var wireframe: RootWireframe!
    var viewModel: AlbumdetailViewModel!
    private var photos = [PhotoAlbum]()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        cell.loadImage(from: photos[indexPath.row].url)
        return cell
    }
}

extension AlbumdetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.width / 2 ) - 10
        return CGSize(width: size, height: size)
    }
}

// MARK: - private functions
private extension AlbumdetailViewController {
    
    func setupUI() {
        title = viewModel.album.title
        collectionView.register(R.nib.photoCollectionViewCell)
        collectionView.delegate = self
        loadDatas()
    }
    
    func loadDatas() {
        viewModel.photos()
            .subscribe(onSuccess: { [weak self] photos in
                guard let strongSelf = self else { return }
                strongSelf.photos = photos
                strongSelf.collectionView.reloadData()
            })
        .disposed(by: disposeBag)
    }    
}
