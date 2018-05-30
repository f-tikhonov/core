//
//  SignUpSocketAPIRequestModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SignUpSocketAPIRequestModel: BaseSocketRequest, Encodable {

    var version: Int = Remote.versionAPI
    var type: NetworkType = .request
    var cmd: String = AppURL.Socket.User.signUp
    var authHeader: String = "o_uas_user" // не понятно, но она нужна серверу

    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var password: String
    var confirmPassword: String

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case cmd
        case id
        case data
    }

    enum DataKeys: String, CodingKey {
        case key = "$"
        case user = "o"
    }

    enum UserKeys: String, CodingKey {
        case firstName = "uas_user_first_name"
        case lastName = "uas_user_last_name"
        case email = "uas_user_email"
        case phone = "uas_user_phone"
        case password = "uas_user_password"
        case confirmPassword = "uas_user_confirm_password"
    }

    func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: RootKeys.self)
        try rootContainer.encode(version, forKey: .version)
        try rootContainer.encode(type.rawValue, forKey: .type)
        try rootContainer.encode(cmd, forKey: .cmd)
        try rootContainer.encode(id, forKey: .id)

        var dataContainer = rootContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(authHeader, forKey: .key)

        var userContainer = dataContainer.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        try userContainer.encode(firstName, forKey: .firstName)
        try userContainer.encode(lastName, forKey: .lastName)
        try userContainer.encode(email, forKey: .email)
        try userContainer.encode(phone, forKey: .phone)
        try userContainer.encode(password, forKey: .password)
        try userContainer.encode(confirmPassword, forKey: .confirmPassword)
    }

    internal init (firstName: String,
                   lastName: String,
                   email: String,
                   phone: String,
                   password: String,
                   confirmPassword: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
