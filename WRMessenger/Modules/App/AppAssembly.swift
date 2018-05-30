//
//  AppAssembly.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class AppAssemblyContainer: Assembly {

    func assemble(container: Container) {

        container.register(AppDataManager.self) { (r, interactor: AppInteractor) in
            let datamanager = AppDataManager()
            datamanager.interactor = interactor
        
            return datamanager
        }

        container.register(AppInteractor.self) { (r, presenter: AppPresenter) in
            let interactor = AppInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(AppDataManager.self, argument: interactor)

            return interactor
        }

        container.register(AppRouter.self) { (r, view: AppView) in
            let router = AppRouter()
            router.transitionHandler = view

            return router
        }

        container.register(AppPresenter.self) { (r, view: AppView) in
            let presenter = AppPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(AppInteractor.self, argument: presenter)
            presenter.router = r.resolve(AppRouter.self, argument: view)

            return presenter
        }

        container.storyboardInitCompleted(AppView.self) { r, view in
            view.presenter = r.resolve(AppPresenter.self, argument: view)
        }
        
    }

}
