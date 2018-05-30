//
//  ContactRemoveSocketAPIRequestModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/30/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct ContactDeleteSocketAPIRequestModel: BaseSocketRequest, Encodable {

    var version: Int = Remote.versionAPI
    var type: NetworkType = .request
    var cmd: String = AppURL.Socket.Contact.delete
    var dataType: String = "o_wrm_contact"

    var contactID: String
    
    // MARK: - Encodable
    enum RootKeys: String, CodingKey {
        case version
        case type
        case cmd
        case id
        case data
    }

    enum DataKeys: String, CodingKey {
        case type = "$"
        case object = "o"
    }

    enum DataObjectKeys: String, CodingKey {
        case id
    }

    func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: RootKeys.self)
        try rootContainer.encode(version, forKey: .version)
        try rootContainer.encode(type.rawValue, forKey: .type)
        try rootContainer.encode(cmd, forKey: .cmd)
        try rootContainer.encode(id, forKey: .id)

        var dataContainer = rootContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(dataType, forKey: .type)

        var contactContainer = dataContainer.nestedContainer(keyedBy: DataObjectKeys.self, forKey: .object)
        try contactContainer.encode(id, forKey: .id)
    }

    internal init (contactID: String) {
        self.contactID = contactID
    }
}
