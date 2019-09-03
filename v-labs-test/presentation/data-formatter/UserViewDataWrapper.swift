//
//  UserViewDataWrapper.swift
//  v-labs-test
//
//  Created by Kevin ESPRIT on 03/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

class UserViewDataWrapper {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var company: String { return "💼 \(user.company.name)"}
    var email: String { return "📧 \(user.email)"}
    var phone: String { return "☎ \(user.phone)"}
    var website: String { return "💻 \(user.website)"}
}
