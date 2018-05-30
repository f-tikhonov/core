//
//  ProfileEditRouter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol ProfileEditRouterInput: class {
    func goBack()
}

final class ProfileEditRouter {
	weak var transitionHandler: TransitionHandler!

}

// MARK: - ProfileEditRouter: ProfileEditRouterInput
extension ProfileEditRouter: ProfileEditRouterInput {
    func goBack() {
        (transitionHandler as? UIViewController)?.navigationController?.popViewController(animated: true)
    }
}
