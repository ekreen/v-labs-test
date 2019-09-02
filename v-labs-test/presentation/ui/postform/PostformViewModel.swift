//
//  PostformViewModel.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

class PostformViewModel {
    private let contentRepository: ContentRepository
    private let user: User
    
    init(contentRepository: ContentRepository, user: User) {
        self.contentRepository = contentRepository
        self.user = user
    }
    
    func createPost(title: String, body: String) -> Completable {
        let post = Post(userId: user.id, id: nil, title: title, body: body)
        return contentRepository.createPost(with: post)
    }
}
