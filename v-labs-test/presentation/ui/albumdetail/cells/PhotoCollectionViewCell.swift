//
//  PhotoCollectionViewCell.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.kf.indicatorType = .activity
    }
}

extension PhotoCollectionViewCell {
    func loadImage(from stringUrl: String) {
        guard let url = URL(string: stringUrl) else {
            return
        }
        imageView.kf.setImage(with: url)
    }
}
