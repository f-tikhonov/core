//
//  AuthSocketAPI.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SignInSocketAPIRequestModel: Encodable {
    var version: Int = Remote.versionAPI
    var type: NetworkType = .request
    var cmd: String = AppURL.Socket.User.signIn
    var authHeader: String = "o_uas_user" // не понятно, но она нужна серверу
    var id: Int
    var login: String
    var password: String
    var uuid: String

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case cmd
        case id
        case data
    }

    enum DataKeys: String, CodingKey {
        case auth
        case uuid
    }

    enum AuthKeys: String, CodingKey {
        case key = "$"
        case user = "o"
    }

    enum UserKeys: String, CodingKey {
        case login = "uas_user_email"
        case password = "uas_user_password"
    }

    func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: RootKeys.self)
        try rootContainer.encode(version, forKey: .version)
        try rootContainer.encode(type.rawValue, forKey: .type)
        try rootContainer.encode(cmd, forKey: .cmd)
        try rootContainer.encode(id, forKey: .id)

        var dataContainer = rootContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(uuid, forKey: .uuid)

        var authContainer = dataContainer.nestedContainer(keyedBy: AuthKeys.self, forKey: .auth)
        try authContainer.encode(authHeader, forKey: .key)

        var userContainer = authContainer.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        try userContainer.encode(login, forKey: .login)
        try userContainer.encode(password, forKey: .password)
    }

    internal init (id: Int,
                   login: String,
                   password: String,
                   uuid: String) {
        self.id = id
        self.login = login
        self.password = password
        self.uuid = uuid
    }
}
