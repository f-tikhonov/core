//
//  UserInfoSocketAPIRequestModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct UserInfoSocketAPIRequestModel: BaseSocketRequest, Encodable {

    var version: Int = Remote.versionAPI
    var type: NetworkType = .request
    var cmd: String = AppURL.Socket.User.getInfo
    
    var authHeader: String = "o_uas_user" // не понятно, но она нужна серверу

    var userID: String

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
        case object = "o"
    }

    enum UserKeys: String, CodingKey {
        case userID = "id"
    }

    func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: RootKeys.self)
        try rootContainer.encode(version, forKey: .version)
        try rootContainer.encode(type.rawValue, forKey: .type)
        try rootContainer.encode(cmd, forKey: .cmd)
        try rootContainer.encode(id, forKey: .id)

        var dataContainer = rootContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(authHeader, forKey: .key)

        var userContainer = dataContainer.nestedContainer(keyedBy: UserKeys.self, forKey: .object)
        try userContainer.encode(userID, forKey: .userID)
    }

    internal init (userID: String) {
        self.userID = userID
    }
}
