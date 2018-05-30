//
//  SignUpView.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol SignUpViewInput: class {
	func setupInitialState()
    func showError(title: String, body: String)
}

protocol SignUpViewOutput: class {
	func viewIsReady()
    func handleNextAction(firstName: String?,
                          lastName: String?,
                          email: String?,
                          phone: String?,
                          password: String?,
                          confirmPassword: String?)
}

final class SignUpView: UIViewController {

    // MARK: - Properties
    var presenter: SignUpViewOutput!

    // MARK: - Outlets
    @IBOutlet private weak var firstNameTextField: DesignableTextField!
    @IBOutlet private weak var lastNameTextField: DesignableTextField!
    @IBOutlet private weak var emailTextField: DesignableTextField!
    @IBOutlet private weak var phoneTextField: DesignableTextField!
    @IBOutlet private weak var passwordTextField: DesignableTextField!
    @IBOutlet private weak var confirmPasswordTextField: DesignableTextField!

    @IBOutlet private weak var nextButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()

        navigationItem.title = LS.Registration.title.localized()
        view.backgroundColor = AppStyle.Color.SignUp.background

        setupUserFields()
        setupButtons()
        setupKeyboardHiding()
    }

    // MARK: - Actions
    @IBAction func tapNextButton(_ sender: UIButton) {
        presenter.handleNextAction(firstName: firstNameTextField.text,
                                   lastName: lastNameTextField.text,
                                   email: emailTextField.text,
                                   phone: phoneTextField.text,
                                   password: passwordTextField.text,
                                   confirmPassword: confirmPasswordTextField.text)
    }

    // MARK: - Private funcs
    private func setupUserFields() {
        firstNameTextField.placeholder = LS.Registration.FirstNameTextField.placeholder.localized()
        lastNameTextField.placeholder = LS.Registration.LastNameTextField.placeholder.localized()
        emailTextField.placeholder = LS.Registration.EmailTextField.placeholder.localized()
        phoneTextField.placeholder = LS.Registration.PhoneNameTextField.placeholder.localized()

        passwordTextField.placeholder = LS.Registration.PasswordTextField.placeholder.localized()

        confirmPasswordTextField.placeholder = LS.Registration.ConfirmPasswordTextField.placeholder.localized()
    }

    private func setupButtons() {
        nextButton.setImage(#imageLiteral(resourceName: "goNext"), for: .normal)
    }
}

// MARK: - SignUpViewInput
extension SignUpView: SignUpViewInput {
    func setupInitialState() {

    }

    func showError(title: String, body: String) {
        alert(title, message: body)
    }
}
