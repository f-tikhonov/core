//
//  SignUpDataManager.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol SignUpDataManagerInput: class {
    
}

protocol SignUpDataManagerOutput: class {
    
}

final class SignUpDataManager {

    weak var interactor: SignUpDataManagerOutput!

    init() {
        #if DEBUG
        print("SignUpDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("SignUpDataManager deinit()")
        #endif
    }
}

// MARK: - SignUpDataManager: SignUpDataManagerInput
extension SignUpDataManager: SignUpDataManagerInput {

}
