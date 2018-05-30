//
//  SignUpSocketAPIResponseModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SignUpSocketAPIResponseModel: BaseSocketResponse, Decodable {
    
    var version: Int
    var type: NetworkType
    var responseID: String
    var status: Bool
    
    var dataType: String // не понятно, но она нужна серверу

    var user: UserResultModel

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case id
        case status
        case data
    }

    enum DataKeys: String, CodingKey {
        case type = "$"
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

        user = try dataContainer.decode(UserResultModel.self, forKey: .object)
    }
}
