//
//  SignUpRouter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol SignUpRouterInput: class {

}

final class SignUpRouter {

	weak var transitionHandler: TransitionHandler!

}

// MARK: - SignUpRouter: SignUpRouterInput
extension SignUpRouter: SignUpRouterInput {
	
}
