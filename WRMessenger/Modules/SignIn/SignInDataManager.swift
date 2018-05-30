//
//  SignInDataManager.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol SignInDataManagerInput: class {
    func signIn(login: String,
                password: String,
                uuid: String,
                successCallback: @escaping ((SignInRestAPIResponseModel) -> Void),
                errorCallback: @escaping (String) -> Void)
}

protocol SignInDataManagerOutput: class {
    
}

final class SignInDataManager {

    weak var interactor: SignInDataManagerOutput!
    var authService: AuthService!

    init() {
        #if DEBUG
        print("SignInDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("SignInDataManager deinit()")
        #endif
    }
}

// MARK: - SignInDataManager: SignInDataManagerInput
extension SignInDataManager: SignInDataManagerInput {
    func signIn(login: String,
                password: String,
                uuid: String,
                successCallback: @escaping ((SignInRestAPIResponseModel) -> Void),
                errorCallback: @escaping (String) -> Void) {
        authService.signIn(login: login, password: password, uuid: uuid, successCallback: { (result) in
            print(result.success)
        }) { (error) in
            print(error)
        }
    }
}
