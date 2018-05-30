//
//  ContactResultModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct ContactResultModel: Decodable {
    var contactID: String
    var fromUserID: String
    var toUserID: String
    var deleted: Bool = false

    enum DataObjectKeys: String, CodingKey {
        case id
        case from = "from_user_id"
        case to = "to_user_id"
        case deleted
    }

    enum ContactDataKeys: String, CodingKey {
        case type
        case object
    }

    enum ContactKeys: String, CodingKey {
        case id
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataObjectKeys.self)
        contactID = try container.decode(String.self, forKey: .id)
        deleted = try container.decode(Bool.self, forKey: .deleted)

        let fromContainer = try container.nestedContainer(keyedBy: ContactDataKeys.self, forKey: .from)
        let fromContact = try fromContainer.nestedContainer(keyedBy: ContactKeys.self, forKey: .object)
        fromUserID = try fromContact.decode(String.self, forKey: .id)

        let toContainer = try container.nestedContainer(keyedBy: ContactDataKeys.self, forKey: .to)
        let toContact = try toContainer.nestedContainer(keyedBy: ContactKeys.self, forKey: .object)
        toUserID = try toContact.decode(String.self, forKey: .id)
    }

}
