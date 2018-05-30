//
//  Message.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import RealmSwift

class Message: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let contacts = List<User>()
}
