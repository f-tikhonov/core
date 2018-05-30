//
//  User.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import RealmSwift

class User: Object {
    @objc dynamic var id = ""
    @objc dynamic var last_name = ""
    @objc dynamic var middle_name = ""
    @objc dynamic var first_name = ""
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var phone = ""
    @objc dynamic var photo = ""
    @objc dynamic var photo_local = ""
    @objc dynamic var create_date = NSDate()
    @objc dynamic var deleted = NSDate()
    let contactList = List<Contact>()
    let chatList = List<Chat>()
    override static func primaryKey() -> String? {
        return "id"
    }

}
