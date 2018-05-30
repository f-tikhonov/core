//
//  SignUpInteractor.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol SignUpInteractorInput: class {
    func registerUser(firstName: String, lastName: String, email: String, phone: String, password: String, confirmPassword: String)
}

protocol SignUpInteractorOutput: class {
    func successfulSignUp()
}

final class SignUpInteractor {

    weak var presenter: SignUpInteractorOutput!
    var datamanager: SignUpDataManagerInput!
    var authService: AuthService!
    
    var deviceIdentifierService: DeviceIdentifierService!
}

// MARK: - SignUpInteractor: SignUpInteractorInput
extension SignUpInteractor: SignUpInteractorInput {

    func registerUser(firstName: String,
                      lastName: String,
                      email: String,
                      phone: String,
                      password: String,
                      confirmPassword: String) {
        
        let uuid = deviceIdentifierService.deviceIdentifier()
        authService.signUp(login: email,
                           password: password,
                           firstName: firstName,
                           middleName: nil,
                           lastName: lastName,
                           uuid: uuid)
    }
    
}

// MARK: - SignUpInteractor: SignUpDataManagerOutput
extension SignUpInteractor: SignUpDataManagerOutput {
    
}
