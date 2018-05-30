//
//  AppRouter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol AppRouterInput: class {

}

final class AppRouter {

	weak var transitionHandler: TransitionHandler!

}

// MARK: - AppRouter: AppRouterInput
extension AppRouter: AppRouterInput {
	
}