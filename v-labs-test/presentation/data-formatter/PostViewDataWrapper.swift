//
//  PostViewDataWrapper.swift
//  v-labs-test
//
//  Created by Kevin ESPRIT on 03/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

class PostViewDataWrapper {
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var title : String {
        get {
            return "💬 \(post.title)"
        }
    }
}
