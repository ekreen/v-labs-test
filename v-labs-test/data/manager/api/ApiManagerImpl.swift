//
//  ApiManagerImpl.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import Moya
import RxSwift

class ApiManagerImpl: ApiManager {
    private let provider = MoyaProvider<ApiService>()
    
    func getUsers() -> Single<[User]> {
        return provider.rx.request(.users)
        .map([User].self)
    }
    
    func getAlbums(for userId: Int) -> Single<[Album]> {
        return provider.rx.request(.albums(userId: userId))
        .map([Album].self)
    }
    
    func getPosts(for userId: Int) -> Single<[Post]> {
        return provider.rx.request(.posts(userId: userId))
            .map([Post].self)
    }
}
