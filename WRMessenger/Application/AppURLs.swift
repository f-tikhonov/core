//
//  URL.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/29/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct AppURL {
    struct REST {
        struct User {
            static let signIn: String = "wrm/uas/user/auth"
            static let signUp: String = "wrm/user/create"
        }
    }

    struct Socket {
        struct User {
            static let signIn: String = "h/user/sign_in"
            static let signUp: String = "h/user/registration"
            static let signOut: String = "h/user/sign_out"
            static let update: String = "h/user/edit"
            static let getInfo: String = "h/user/get/one"
            static let search: String = "h/user/search"
            static let delete: String = "h/user/delete"
        }

        struct Contact {
            static let create: String = "h/contact/create"
            static let getOne: String = "h/contact/get/one"
            static let getAll: String = "h/contact/get/all"
            static let delete: String = "h/contact/delete"
        }
    }
}
