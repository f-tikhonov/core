//
//  ChatList.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import RealmSwift

class ChatList: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let chatList = List<Chat>()
}
