//
//  SignUpAssembly.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class SignUpAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SignUpDataManager.self) { (r, interactor: SignUpInteractor) in
            let datamanager = SignUpDataManager()
            datamanager.interactor = interactor
            interactor.deviceIdentifierService = r.resolve(DeviceIdentifierService.self)
            return datamanager
        }
        
        container.register(SignUpInteractor.self) { (r, presenter: SignUpPresenter) in
            let interactor = SignUpInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(SignUpDataManager.self, argument: interactor)
            interactor.authService = r.resolve(AuthService.self)

            return interactor
        }
        
        container.register(SignUpRouter.self) { (r, view: SignUpView) in
            let router = SignUpRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(SignUpPresenter.self) { (r, view: SignUpView) in
            let presenter = SignUpPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(SignUpInteractor.self, argument: presenter)
            presenter.router = r.resolve(SignUpRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(SignUpView.self) { r, view in
            view.presenter = r.resolve(SignUpPresenter.self, argument: view)
        }
        
    }
    
}
