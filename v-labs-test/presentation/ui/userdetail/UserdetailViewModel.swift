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
    
    func albums() -> Single<[Album]> {
        return contentRepository.getAlbums(for: user.id)
    }
    
    func posts() -> Single<[Post]> {
        return contentRepository.getPosts(for: user.id)
    }
}
