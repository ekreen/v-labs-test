//
//  UserdetailViewModel.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

class UserdetailViewModel {
    
    private let contentRepository: ContentRepository
    let user: User
    
    init(contentRepository: ContentRepository, user: User) {
        self.contentRepository = contentRepository
        self.user = user
    }
    
    func albums() -> Single<[AlbumViewDataWrapper]> {
        return contentRepository.getAlbums(for: user.id)
            .map { $0.map { AlbumViewDataWrapper(album: $0) } }
    }
    
    func posts() -> Single<[PostViewDataWrapper]> {
        return contentRepository.getPosts(for: user.id)
            .map { $0.map { PostViewDataWrapper(post: $0) } }
    }
}
