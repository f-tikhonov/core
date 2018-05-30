//
//  ProfilePresenter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol ProfileModuleInput: class {

}

final class ProfilePresenter {

    // MARK: - Properties
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!

    var user = UserResultModel(userIdentifier: "userID",
                               username: "username",
                               firstName: "firstName",
                               lastName: "lastName",
                               middleName: "middleName",
                               createDate: "createDate",
                               email: "email",
                               avatarImageURL: nil,
                               isDeleted: false)

    init() {
        #if DEBUG
        print("ProfilePresenter init()")
        #endif
    }

}

// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {

    func viewIsReady() {
        view.setupInitialState(user: user)
    }

    func didTapEdit() {
        router.showEdit(for: user, output: self)
    }

    func didTapPhoto() {
        view.showAvatarSelection()
    }

    func didTapLogout() {

    }

    func didTapNotificationSetup() {
        router.showNotificationSettings()
    }
}

extension ProfilePresenter: ProfileEditModuleOutput {
    func save(user: UserResultModel) {
        self.user = user
    }
}

// MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {


}

// MARK: - ProfileModuleInput
extension ProfilePresenter: ProfileModuleInput {


}
