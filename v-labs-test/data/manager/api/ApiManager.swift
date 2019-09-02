//
//  ApiManager.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import RxSwift

protocol ApiManager {
    func getUsers() -> Single<[User]>
    func getAlbums(for userId: Int) -> Single<[Album]>
    func getPosts(for userId: Int) -> Single<[Post]>
    func getPhotos(for albumId: Int) -> Single<[PhotoAlbum]>
    func createPost(with post: Post) -> Completable
}
