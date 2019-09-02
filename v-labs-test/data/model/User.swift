//
//  User.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 01/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Adress
    let phone: String
    let website: String
    let company: Company
}
