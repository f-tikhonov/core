//
//  RootAssembly.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class RootAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RootDataManager.self) { (r, interactor: RootInteractor) in
            let datamanager = RootDataManager()
            datamanager.interactor = interactor
            
            return datamanager
        }
        
        container.register(RootInteractor.self) { (r, presenter: RootPresenter) in
            let interactor = RootInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(RootDataManager.self, argument: interactor)
            
            return interactor
        }
        
        container.register(RootRouter.self) { (r, view: RootView) in
            let router = RootRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(RootPresenter.self) { (r, view: RootView) in
            let presenter = RootPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(RootInteractor.self, argument: presenter)
            presenter.router = r.resolve(RootRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(RootView.self) { r, view in
            view.presenter = r.resolve(RootPresenter.self, argument: view)
        }
        
    }
    
}
