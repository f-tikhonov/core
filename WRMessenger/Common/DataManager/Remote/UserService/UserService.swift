//
//  UserService.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol UserServiceInput {
    
}

protocol UserServiceOutput {
    
}

final class UserService: UserServiceInput, UserServiceOutput {
    
    init() {
        #if DEBUG
        print("UserService init()")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("UserService deinit()")
        #endif
    }
    
    // MARK: -
    // MARK: UserServiceInput
    
    // MARK: -
    // MARK: UserServiceOutput
}
