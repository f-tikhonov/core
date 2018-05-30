//
//  ProfileEditPresenter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol ProfileEditModuleInput: class {
    func set(user: UserResultModel, output: ProfileEditModuleOutput?)
}

protocol ProfileEditModuleOutput: class {
    func save(user: UserResultModel)
}

final class ProfileEditPresenter {

    // MARK: - Properties

    weak var view: ProfileEditViewInput!
    weak var output: ProfileEditModuleOutput?

    var interactor: ProfileEditInteractorInput!
    var router: ProfileEditRouterInput!
    var user: UserResultModel!

    init() {
        #if DEBUG
        print("ProfileEditPresenter init()")
        #endif
    }

}

// MARK: - ProfileEditViewOutput
extension ProfileEditPresenter: ProfileEditViewOutput {
    func didTapSave(firstName: String?, lastName: String?) {
//        let userToSave: UserResult = UserResult(userIdentifier: user.userIdentifier,
//                                                username: user.username,
//                                                firstName: firstName,
//                                                lastName: lastName,
//                                                middleName: user.middleName,
//                                                createDate: user.createDate,
//                                                email: user.email,
//                                                avatarImageURL: user.avatarImageURL)
//        output?.save(user: userToSave)
        router.goBack()
    }

    func viewIsReady() {
        view.setupInitialState()
    }

}

// MARK: - ProfileEditInteractorOutput
extension ProfileEditPresenter: ProfileEditInteractorOutput {


}

// MARK: - ProfileEditModuleInput
extension ProfileEditPresenter: ProfileEditModuleInput {
    func set(user: UserResultModel, output: ProfileEditModuleOutput?) {
        self.user = user
        self.output = output
        view.show(user: user)
    }
}
