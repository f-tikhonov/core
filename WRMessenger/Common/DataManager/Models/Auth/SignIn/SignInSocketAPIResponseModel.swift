//
//  AuthSocketAPIResult.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 29.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SignInSocketAPIResponseModel: BaseSocketResponse, Decodable {
    
    var version: Int
    var type: NetworkType
    var responseID: String
    var status: Bool
    
    var dataType: String // не понятно, но она нужна серверу

    var tokenID: String
    var token: String

    var userType: String
    var userID: String

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case id
        case status
        case data
    }

    enum DataKeys: String, CodingKey {
        case type
        case object = "o"
    }

    enum ObjectKeys: String, CodingKey {
        case tokenID = "id"
        case token = "access_token"
        case userID = "user_id"
    }

    enum UserIDKeys: String, CodingKey {
        case key = "$"
        case object = "o"
    }

    enum UserIDObjectKeys: String, CodingKey {
        case id
    }

    enum UserKeys: String, CodingKey {
        case login = "uas_user_email"
        case password = "uas_user_password"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        version = try container.decode(Int.self, forKey: .version)
        type = NetworkType(rawValue: try container.decode(String.self, forKey: .type)) ?? .response
        responseID = try container.decode(String.self, forKey: .id)
        status = try container.decode(Bool.self, forKey: .status)

        let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        dataType = try dataContainer.decode(String.self, forKey: .type)

        let dataObjectContainer = try dataContainer.nestedContainer(keyedBy: ObjectKeys.self, forKey: .object)
        tokenID = try dataObjectContainer.decode(String.self, forKey: .tokenID)
        token = try dataObjectContainer.decode(String.self, forKey: .token)

        let userIDContainer = try dataObjectContainer.nestedContainer(keyedBy: UserIDKeys.self, forKey: .userID)
        userType = try userIDContainer.decode(String.self, forKey: .key)

        let userIDObjectContainer = try userIDContainer.nestedContainer(keyedBy: UserIDObjectKeys.self, forKey: .object)
        userID = try userIDObjectContainer.decode(String.self, forKey: .id)
    }
}
