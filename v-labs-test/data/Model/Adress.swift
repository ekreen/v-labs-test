//
//  Adress.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

struct Adress: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
