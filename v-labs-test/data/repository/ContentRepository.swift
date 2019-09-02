//
//  ContentRepository.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

class ContentRepository {
    private let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getUsers() -> Single<[User]> {
        return apiManager.getUsers()
    }
    
    func getAlbums(for userId: Int) -> Single<[Album]> {
        return apiManager.getAlbums(for: userId)
    }
    
    func getPosts(for userId: Int) -> Single<[Post]> {
        return apiManager.getPosts(for: userId)
    }
    
    func getPhotos(for albumId: Int) -> Single<[PhotoAlbum]> {
        return apiManager.getPhotos(for: albumId)
    }
}
