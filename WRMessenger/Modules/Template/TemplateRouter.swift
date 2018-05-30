//
//  TemplateRouter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import LightRoute

protocol TemplateRouterInput: class {

}

final class TemplateRouter {

	weak var transitionHandler: TransitionHandler!

}

// MARK: - TemplateRouter: TemplateRouterInput
extension TemplateRouter: TemplateRouterInput {
	
}