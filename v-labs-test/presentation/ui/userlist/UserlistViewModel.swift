//
//  UserlistViewModel.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

class UserlistViewModel {
    
    private var contentRepository: ContentRepository
    
    init(contentRepository: ContentRepository) {
        self.contentRepository = contentRepository
    }
    
    func usersList() -> Single<[User]> {
        return contentRepository.getUsers()
    }
}
