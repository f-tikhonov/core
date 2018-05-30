//
//  SignInPresenter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol SignInModuleInput: class {

}

final class SignInPresenter {

    // MARK: - Properties
    weak var view: SignInViewInput!
    var interactor: SignInInteractorInput!
    var router: SignInRouterInput!

    init() {
        #if DEBUG
            print("SignInPresenter init()")
        #endif
    }

}

// MARK: - SignInViewOutput
extension SignInPresenter: SignInViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }

    func handleRegistrationAction() {
        router.openRegistration()
    }

    func handleLoginAction(login: String?, password: String?) {
        guard let login = login,
              !login.isEmpty else {
                view.showError(title: LS.Login.Error.title.localized(),
                               body: LS.Login.Error.emptyLogin.localized())
                return
        }

        guard let password = password,
              !password.isEmpty else {
                view.showError(title: LS.Login.Error.title.localized(),
                               body: LS.Login.Error.emptyPassword.localized())
                return
        }

        interactor.signIn(login: login,
                          password: password)
    }
}

// MARK: - SignInInteractorOutput
extension SignInPresenter: SignInInteractorOutput {
    func successfulSignIn() {
        router.openProfile()
    }
}

// MARK: - SignInModuleInput
extension SignInPresenter: SignInModuleInput {

}
