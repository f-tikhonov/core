//
//  SignInAssembly.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class SignInAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SignInDataManager.self) { (r, interactor: SignInInteractor) in
            let datamanager = SignInDataManager()
            datamanager.interactor = interactor
            datamanager.authService = r.resolve(AuthService.self)
            interactor.deviceIdentifierService = r.resolve(DeviceIdentifierService.self)
            
            return datamanager
        }
        
        container.register(SignInInteractor.self) { (r, presenter: SignInPresenter) in
            let interactor = SignInInteractor()
            interactor.presenter = presenter
            interactor.dataManager = r.resolve(SignInDataManager.self, argument: interactor)
            
            return interactor
        }
        
        container.register(SignInRouter.self) { (r, view: SignInView) in
            let router = SignInRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(SignInPresenter.self) { (r, view: SignInView) in
            let presenter = SignInPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(SignInInteractor.self, argument: presenter)
            presenter.router = r.resolve(SignInRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(SignInView.self) { r, view in
            view.presenter = r.resolve(SignInPresenter.self, argument: view)
        }
        
    }
    
}
