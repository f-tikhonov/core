//
//  ProfileRouter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol ProfileRouterInput: class {
    func showEdit(for user: UserResultModel, output: ProfileEditModuleOutput?)
    func showNotificationSettings()
}

final class ProfileRouter {

	weak var transitionHandler: TransitionHandler!

}

// MARK: - ProfileRouter: ProfileRouterInput
extension ProfileRouter: ProfileRouterInput {
    func showEdit(for user: UserResultModel, output: ProfileEditModuleOutput?) {
        try? transitionHandler?
            .forSegue(identifier: SegueFrom.ProfileTo.profileEdit, to: ProfileEditModuleInput.self)
            .then{ moduleInput in
                moduleInput.set(user: user, output: output)
        }
    }

    func showNotificationSettings() {
        try? transitionHandler?
            .forSegue(identifier: SegueFrom.ProfileTo.notificationSetup, to: NotificationSetupModuleInput.self)
            .perform()
    }
}
