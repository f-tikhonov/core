//
//  RootDataManager.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol RootDataManagerInput: class {

}

protocol RootDataManagerOutput: class {
    
}

final class RootDataManager {

    weak var interactor: RootDataManagerOutput!

    init() {
        #if DEBUG
        print("RootDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("RootDataManager deinit()")
        #endif
    }
}

// MARK: - RootDataManager: RootDataManagerInput
extension RootDataManager: RootDataManagerInput {

}
