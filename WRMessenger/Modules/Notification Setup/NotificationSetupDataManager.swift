//
//  NotificationSetupDataManager.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol NotificationSetupDataManagerInput: class {

}

protocol NotificationSetupDataManagerOutput: class {
    
}

final class NotificationSetupDataManager {

    weak var interactor: NotificationSetupDataManagerOutput!

    init() {
        #if DEBUG
        print("NotificationSetupDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("NotificationSetupDataManager deinit()")
        #endif
    }
}

// MARK: - NotificationSetupDataManager: NotificationSetupDataManagerInput
extension NotificationSetupDataManager: NotificationSetupDataManagerInput {

}