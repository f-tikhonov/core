//
//  AuthRepositoryModel.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import KeychainAccess

struct Auth {

    static var isAuth: Bool {
        let hasUser = !user.isEmpty
        let hasPassword = !password.isEmpty
        let hasToken = !token.isEmpty

        return hasUser && hasPassword && hasToken
    }

    static let keychain = Keychain(service: "com.iseck.wrmessenger")
    
    static var user: String {
        get {
            return (keychain["wrm_user"] != nil ? keychain["wrm_user"]! : "")
        }
        set {
            keychain["wrm_user"] = newValue
        }
    }
    
    static var password: String {
        get {
            return (keychain["wrm_password"] != nil ? keychain["wrm_password"]! : "")
        }
        set {
            keychain["wrm_password"] = newValue
        }
    }

    static var token: String {
        get {
            return (keychain["wrm_token"] != nil ? keychain["wrm_token"]! : "")
        }
        set {
            keychain["wrm_token"] = newValue
        }
    }
}
