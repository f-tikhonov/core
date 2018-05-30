//
//  ProfileDataManager.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol ProfileDataManagerInput: class {

}

protocol ProfileDataManagerOutput: class {
    
}

final class ProfileDataManager {

    weak var interactor: ProfileDataManagerOutput!

    init() {
        #if DEBUG
        print("ProfileDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("ProfileDataManager deinit()")
        #endif
    }
}

// MARK: - ProfileDataManager: ProfileDataManagerInput
extension ProfileDataManager: ProfileDataManagerInput {

}