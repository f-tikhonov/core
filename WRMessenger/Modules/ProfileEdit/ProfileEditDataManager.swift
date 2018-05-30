//
//  ProfileEditDataManager.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol ProfileEditDataManagerInput: class {

}

protocol ProfileEditDataManagerOutput: class {
    
}

final class ProfileEditDataManager {

    weak var interactor: ProfileEditDataManagerOutput!

    init() {
        #if DEBUG
        print("ProfileEditDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("ProfileEditDataManager deinit()")
        #endif
    }
}

// MARK: - ProfileEditDataManager: ProfileEditDataManagerInput
extension ProfileEditDataManager: ProfileEditDataManagerInput {

}