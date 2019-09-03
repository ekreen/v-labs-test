//
//  AlbumViewDataWrapper.swift
//  v-labs-test
//
//  Created by Kevin ESPRIT on 03/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

class AlbumViewDataWrapper {
    let album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    var title : String {
        get {
            return "💽 \(album.title)"
        }
    }
}
