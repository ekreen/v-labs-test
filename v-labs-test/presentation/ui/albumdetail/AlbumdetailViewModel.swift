//
//  AlbumdetailViewModel.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

class AlbumdetailViewModel {
    
    private let contentRepository: ContentRepository
    let album: Album
    
    init(contentRepository: ContentRepository, album: Album) {
        self.contentRepository = contentRepository
        self.album = album
    }
    
    func photos() -> Single<[PhotoAlbum]> {
        return contentRepository.getPhotos(for: album.id)
    }
}
