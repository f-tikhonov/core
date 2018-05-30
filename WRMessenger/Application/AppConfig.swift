//
//  AppConfig.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Realm
import RealmSwift
import IQKeyboardManagerSwift

struct Remote {
    // MARK: - Production Server
    static var serverApiUrl = "http://backend.messenger.wr.market:27100/"
    static var serverSocketUrl = "ws://backend.messenger.wr.market:27200/"
    static var versionAPI = 1
    static var id = 0
    static var socket: SocketManager!
}

struct Locale {
    static func setupKeyboardHiding() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}

struct KeychainContasts {
    static let deviceIdentifierKey = "com.iseck.wr.messenger.device.identifier.key"
}
