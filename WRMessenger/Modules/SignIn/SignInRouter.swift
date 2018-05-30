//
//  SignInRouter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol SignInRouterInput: class {
    func openRegistration()
    func openProfile()
}

final class SignInRouter: SignInRouterInput {

    weak var transitionHandler: TransitionHandler!

    func openRegistration() {
        try? transitionHandler.forSegue(identifier: SegueFrom.SignInTo.signUp, to: SignUpModuleInput.self)
            .perform()
    }

    func openProfile() {
        try? transitionHandler.forSegue(identifier: SegueFrom.SignInTo.mainApp, to: SignUpModuleInput.self)
            .perform()
    }
}
