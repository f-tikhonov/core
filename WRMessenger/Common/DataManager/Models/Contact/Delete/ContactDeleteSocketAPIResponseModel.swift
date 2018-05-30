//
//  ContactRemoveSocketAPIResponseModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct ContactDeleteSocketAPIResponseModel: BaseSocketResponse, Decodable {

    var version: Int
    var type: NetworkType
    var responseID: String
    var status: Bool

    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case id
        case status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        version = try container.decode(Int.self, forKey: .version)
        type = NetworkType(rawValue: try container.decode(String.self, forKey: .type)) ?? .response
        responseID = try container.decode(String.self, forKey: .id)
        status = try container.decode(Bool.self, forKey: .status)
    }
}
