//
//  AppDataManager.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol AppDataManagerInput: class {

}

protocol AppDataManagerOutput: class {
    
}

final class AppDataManager {

    weak var interactor: AppDataManagerOutput!

    init() {
        #if DEBUG
        print("AppDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("AppDataManager deinit()")
        #endif
    }
}

// MARK: - AppDataManager: AppDataManagerInput
extension AppDataManager: AppDataManagerInput {

}