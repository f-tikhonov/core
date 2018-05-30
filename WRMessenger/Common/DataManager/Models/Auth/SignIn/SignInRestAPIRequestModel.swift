//
//  AuthAPI.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Moya

struct SignInRestAPIRequestModel: Encodable {
    
    var login: String?
    var password: String?
    var uuid: String?

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case data
        case timestamp
    }

    enum DataKeys: String, CodingKey {
        case uasUser = "uas_user"
        case uuid = "wrm_uuid"
    }

    enum UserKeys: String, CodingKey {
        case login = "uas_user_uas_user_email"
        case password = "uas_user_uas_user_password"
    }

    func encode(to encoder: Encoder) throws {
        var dataContainer = encoder.container(keyedBy: RootKeys.self)
        try dataContainer.encode(Int(Date().timeIntervalSince1970), forKey: .timestamp)

        var uuidDataContainer = dataContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try? uuidDataContainer.encode(uuid, forKey: .uuid)

        var userDataContainer = dataContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        var userContainer = userDataContainer.nestedContainer(keyedBy: UserKeys.self, forKey: .uasUser)
        try? userContainer.encode(login, forKey: .login)
        try? userContainer.encode(password, forKey: .password)
    }

    internal init (login: String, password: String, uuid: String) {
        self.login = login
        self.password = password
        self.uuid = uuid
    }
}

