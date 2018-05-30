//
//  NotificationSetupAssembly.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class NotificationSetupAssemblyContainer: Assembly {

    func assemble(container: Container) {

        container.register(NotificationSetupDataManager.self) { (r, interactor: NotificationSetupInteractor) in
            let datamanager = NotificationSetupDataManager()
            datamanager.interactor = interactor
        
            return datamanager
        }

        container.register(NotificationSetupInteractor.self) { (r, presenter: NotificationSetupPresenter) in
            let interactor = NotificationSetupInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(NotificationSetupDataManager.self, argument: interactor)

            return interactor
        }

        container.register(NotificationSetupRouter.self) { (r, view: NotificationSetupView) in
            let router = NotificationSetupRouter()
            router.transitionHandler = view

            return router
        }

        container.register(NotificationSetupPresenter.self) { (r, view: NotificationSetupView) in
            let presenter = NotificationSetupPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(NotificationSetupInteractor.self, argument: presenter)
            presenter.router = r.resolve(NotificationSetupRouter.self, argument: view)

            return presenter
        }

        container.storyboardInitCompleted(NotificationSetupView.self) { r, view in
            view.presenter = r.resolve(NotificationSetupPresenter.self, argument: view)
        }
        
    }

}
