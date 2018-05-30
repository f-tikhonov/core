//
//  SignInView.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol SignInViewInput: class {
    func setupInitialState()
    func showError(title: String, body: String)
}

protocol SignInViewOutput: class {
    func viewIsReady()
    func handleRegistrationAction()
    func handleLoginAction(login: String?,
                           password: String?)
}

final class SignInView: UIViewController {

    // MARK: - Properties
    var presenter: SignInViewOutput!

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loginTextField: DesignableTextField!
    @IBOutlet private weak var passwordTextField: DesignableTextField!

    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var registrationButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()

        titleLabel.text = LS.Login.title.localized()

        UIApplication.shared.statusBarStyle = .lightContent
        view.backgroundColor = AppStyle.Color.SignIn.background

        setupKeyboardHiding()
        setupNavigationBar()
        setupUserFields()
        setupButtons()

        // FIXME: - Убрать данные перед показом
        loginTextField.text = "1527483371777@mail.ru"
        passwordTextField.text = "testPassword"
    }

    // MARK: - Actions
    @IBAction func tapRegistrationButton(_ sender: UIButton) {
        presenter.handleRegistrationAction()
    }

    @IBAction func tapNextButton(_ sender: UIButton) {
        presenter.handleLoginAction(login: loginTextField.text,
                                    password: passwordTextField.text)
    }

    // MARK: - Private funcs
    private func setupNavigationBar() {
        setNavigationBarTransparent()
        setNavigationTitle(color: AppStyle.Color.SignIn.navigationTitle)
        setNavigationBackButton(color: AppStyle.Color.SignIn.navigationButton)
    }

    private func setupUserFields() {
        loginTextField.placeholder = LS.Login.LoginTextField.placeholder.localized()
        passwordTextField.placeholder = LS.Login.PasswordTextField.placeholder.localized()
    }

    private func setupButtons() {
        nextButton.setImage(#imageLiteral(resourceName: "goNext"), for: .normal)
        registrationButton.setTitle(LS.Login.RegistrationButton.title.localized(), for: .normal)
    }
}

// MARK: - SignInViewInput
extension SignInView: SignInViewInput {
    func setupInitialState() {

    }

    func showError(title: String, body: String) {
        alert(title, message: body)
    }
}
