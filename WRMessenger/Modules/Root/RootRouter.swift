//
//  RootRouter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol RootRouterInput: class {
    func openSignIn()
    func openMainFlow()
}

final class RootRouter {
	weak var transitionHandler: TransitionHandler!
    
}

// MARK: - RootRouter: RootRouterInput
extension RootRouter: RootRouterInput {
    func openSignIn() {
        try? transitionHandler.forSegue(identifier: SegueFrom.RootTo.signIn,
                                        to: SignInModuleInput.self)
            .perform()
    }

    func openMainFlow() {
        try? transitionHandler.forSegue(identifier: SegueFrom.RootTo.mainApp,
                                        to: AppView.self)
            .perform()
    }
}
