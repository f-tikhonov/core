//
//  NotificationSetupRouter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol NotificationSetupRouterInput: class {

}

final class NotificationSetupRouter {

	weak var transitionHandler: TransitionHandler!

}

// MARK: - NotificationSetupRouter: NotificationSetupRouterInput
extension NotificationSetupRouter: NotificationSetupRouterInput {
	
}