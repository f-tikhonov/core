//
//  SignInInteractor.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol SignInInteractorInput: class {
    func signIn(login: String,
                password: String)
}

protocol SignInInteractorOutput: class {
    func successfulSignIn()
}

final class SignInInteractor {

    weak var presenter: SignInInteractorOutput!
    var dataManager: SignInDataManagerInput!
    var deviceIdentifierService: DeviceIdentifierService!
}

// MARK: - SignInInteractor: SignInInteractorInput
extension SignInInteractor: SignInInteractorInput {
    func signIn(login: String,
                password: String) {

        let uuid = deviceIdentifierService.deviceIdentifier()
        dataManager.signIn(login: login,
                           password: password,
                           uuid: uuid,
                           successCallback: { [weak self] (result) in
                            guard let userID = result.userIdentifier,
                                  let token = result.accessToken else { return }
                            Auth.user = userID
                            Auth.password = password
                            Auth.token = token
                            self?.presenter.successfulSignIn()
        }) { (error) in
            print(error)
        }
    }
}

// MARK: - SignInInteractor: SignInDataManagerOutput
extension SignInInteractor: SignInDataManagerOutput {

}
