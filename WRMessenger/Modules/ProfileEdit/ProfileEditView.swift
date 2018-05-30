//
//  ProfileEditView.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

protocol ProfileEditViewInput: class {
	func setupInitialState()
    func show(user: UserResultModel)
}

protocol ProfileEditViewOutput: class {
	func viewIsReady()
    func didTapSave(firstName: String?,
                    lastName: String?)
}

final class ProfileEditView: UIViewController {

	// MARK: - Properties
	var presenter: ProfileEditViewOutput!

    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewIsReady()

        configureTextFields()
        configureNavButtons()

        navigationItem.title = LS.ProfileEdit.title.localized()
	}

    // MARK: - Private funcs
    @objc private func tapSave() {
        presenter.didTapSave(firstName: firstNameTextField.text,
                             lastName: lastNameTextField.text)
    }

    private func configureTextFields() {
        firstNameTextField.placeholder = LS.ProfileEdit.FirstNameTextField.placeholder.localized()
        lastNameTextField.placeholder = LS.ProfileEdit.LastNameTextField.placeholder.localized()

        addBottomBorderTo(firstNameTextField)
        addBottomBorderTo(lastNameTextField)
    }

    private func configureNavButtons() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                         target: self,
                                         action: #selector(tapSave))
        navigationItem.rightBarButtonItem = saveButton
    }

    private func addBottomBorderTo(_ view: UIView, color: UIColor = C.Color.grey) {
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0,
                              y: view.frame.size.height - width,
                              width: view.frame.size.width,
                              height: view.frame.size.height)

        border.borderWidth = width

        view.layer.addSublayer(border)
        view.layer.masksToBounds = true
    }

}

// MARK: - ProfileEditViewInput
extension ProfileEditView: ProfileEditViewInput {
    func setupInitialState() {

    }

    func show(user: UserResultModel) {
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
    }
}

// MARK: - Constants
private enum C {
    struct Color {
        static let grey = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        static let lightGrey = UIColor(red: 243/255, green: 245/255, blue: 246/255, alpha: 1)
    }
}
