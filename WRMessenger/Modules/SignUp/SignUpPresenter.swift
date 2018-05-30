//
//  SignUpPresenter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol SignUpModuleInput: class {

}

private enum RegistationType {
    case firstName
    case lastName
    case email
    case phone
    case password
    case confirmPassword
}

private enum ErrorType {
    case isEmpty
}

final class SignUpPresenter {

    // MARK: - Properties
    weak var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
    var router: SignUpRouterInput!

    init() {
        #if DEBUG
            print("SignUpPresenter init()")
        #endif
    }

    private func validate(value: String?, type: RegistationType) -> String? {
        guard let value = value,
              !value.isEmpty else {
            showError(field: type, error: .isEmpty)
            return nil
        }

        return value
    }

    private func showError(field: RegistationType, error: ErrorType) {
        switch error {
        case .isEmpty:
            view.showError(title: LS.Registration.Error.title.localized(),
                           body: LS.Registration.Error.emptyField.localized())
        }
    }

}

// MARK: - SignUpViewOutput
extension SignUpPresenter: SignUpViewOutput {
    func handleNextAction(firstName: String?,
                          lastName: String?,
                          email: String?,
                          phone: String?,
                          password: String?,
                          confirmPassword: String?) {

        guard let firstName = validate(value: firstName, type: .firstName),
              let lastName = validate(value: lastName, type: .lastName),
              let email = validate(value: email, type: .email),
              let phone = validate(value: phone, type: .phone),
              let password = validate(value: password, type: .password),
              let confirmPassword = validate(value: confirmPassword, type: .confirmPassword) else { return }

        interactor.registerUser(firstName: firstName,
                                lastName: lastName,
                                email: email,
                                phone: phone,
                                password: password,
                                confirmPassword: confirmPassword)
    }

    func viewIsReady() {
        view.setupInitialState()
    }

}

// MARK: - SignUpInteractorOutput
extension SignUpPresenter: SignUpInteractorOutput {
    func successfulSignUp() {

    }
}

// MARK: - SignUpModuleInput
extension SignUpPresenter: SignUpModuleInput {

}
