//
//  v_labs_testTests.swift
//  v-labs-testTests
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import XCTest
import RxSwift
@testable import v_labs_test

class v_labs_testContentRepositoryTests: XCTestCase {
    
    var mockApiManager: MockApiManager?
    var contentRepository: ContentRepository?
    var disposeBag = DisposeBag()

    override func setUp() {
        mockApiManager = MockApiManager()
        contentRepository = ContentRepository(apiManager: mockApiManager!)
    }

    override func tearDown() {
        mockApiManager = nil
        contentRepository = nil
    }

    func testUsers() {
        contentRepository?.getUsers()
            .subscribe(onSuccess: { users in
                XCTAssertNotNil(users)
                XCTAssertFalse(users.isEmpty)
            })
        .disposed(by: disposeBag)
    }
    
    func testAlbums() {
        contentRepository?.getAlbums(for: 1)
            .subscribe(onSuccess: { album in
                XCTAssertNotNil(album)
                XCTAssertFalse(album.isEmpty)
            })
            .disposed(by: disposeBag)
    }
    
    func testPosts() {
        contentRepository?.getPosts(for: 1)
            .subscribe(onSuccess: { posts in
                XCTAssertNotNil(posts)
                XCTAssertFalse(posts.isEmpty)
            })
            .disposed(by: disposeBag)
    }
    
    func testPhotos() {
        contentRepository?.getPhotos(for: 1)
            .subscribe(onSuccess: { photos in
                XCTAssertNotNil(photos)
                XCTAssertFalse(photos.isEmpty)
            })
            .disposed(by: disposeBag)
    }
}
