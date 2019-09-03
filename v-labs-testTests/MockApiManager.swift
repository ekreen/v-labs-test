//
//  MockApiManager.swift
//  v-labs-testTests
//
//  Created by Kevin ESPRIT on 03/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import Foundation
import RxSwift
@testable import v_labs_test

class MockApiManager: ApiManager  {
    
    private let mockUser = User(id: 1, name: "Jean", username: "Jean88", email: "jean@email.com",
                                address: Adress(street: "street", suite: "", city: "BigCity", zipcode: "35000",
                                                geo: Geo(lat: "0.0", lng: "0.0")),
                                phone: "092743839", website: "www.jean.com",
                                company: Company(name: "BigCompany", catchPhrase: "A mindless worker is a happy worker!", bs: ""))
    private let mockAlbum = Album(userId: 1, id: 1, title: "The Album")
    private let mockPost = Post(userId: 1, id: 1, title: "Post title", body: "A big body")
    private let mockPhoto = PhotoAlbum(albumId: 1, id: 1, title: "Great photo", url: "http://www.album.com", thumbnailUrl: "http://www.album.com")
    
    func getUsers() -> Single<[User]> {
        return Single.just([mockUser, mockUser, mockUser])
    }
    
    func getAlbums(for userId: Int) -> Single<[Album]> {
        return Single.just([mockAlbum, mockAlbum, mockAlbum])
    }
    
    func getPosts(for userId: Int) -> Single<[Post]> {
        return Single.just([mockPost, mockPost, mockPost])
    }
    
    func getPhotos(for albumId: Int) -> Single<[PhotoAlbum]> {
        return Single.just([mockPhoto, mockPhoto, mockPhoto])
    }
    
    func createPost(with post: Post) -> Completable {
        return Completable.empty()
    }
}
