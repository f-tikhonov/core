//
//  AuthSocketAPI.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/29/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

enum AuthSocketAPI {
    case signIn(id: Int, login: String, password: String, uuid: String)
    case signUp()
    case signOut()
    case updateToken()
}

extension AuthSocketAPI {
    var data: Data {
        switch self {
        case .signIn(let id, let login, let password, let uuid):
            let authModel = SignInSocketAPIRequestModel(id: id, login: login,
                                                      password: password,
                                                      uuid: uuid)
            return try! JSONEncoder().encode(authModel)
        case .signOut:
            return "".data(using: .utf8)!
        case .signUp:
            return "".data(using: .utf8)!
        case .updateToken:
            return "".data(using: .utf8)!
        }
    }
}
