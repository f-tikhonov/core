//
//  AuthSocketService.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 30.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation
import Starscream

final class AuthSocketService {
    let socket = Remote.socket
    
    init() {
        #if DEBUG
        print("AuthService init()")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("AuthService deinit()")
        #endif
    }
    
}

// MARK: - AuthSocketServiceInput
extension AuthSocketService: AuthServiceInput {

    func signIn(login: String,
                password: String,
                uuid: String,
                successCallback: @escaping ((SignInRestAPIResponseModel) -> Void),
                errorCallback: @escaping (String) -> Void) {
        let id = Remote.id
        let data = AuthSocketAPI.signIn(id: id, login: login, password: password, uuid: uuid).data
        socket?.sendData(data)
        
        
    }
    
    func signUp(login: String,
                password: String,
                firstName: String,
                middleName: String?,
                lastName: String,
                uuid: String) {
    }

}

// MARK: -
// MARK: AuthServiceOutput
extension AuthSocketService: AuthServiceOutput {
    
}
