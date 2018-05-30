//
//  TemplateAssembly.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class TemplateAssemblyContainer: Assembly {

    func assemble(container: Container) {

        container.register(TemplateDataManager.self) { (r, interactor: TemplateInteractor) in
            let datamanager = TemplateDataManager()
            datamanager.interactor = interactor
        
            return datamanager
        }

        container.register(TemplateInteractor.self) { (r, presenter: TemplatePresenter) in
            let interactor = TemplateInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(TemplateDataManager.self, argument: interactor)

            return interactor
        }

        container.register(TemplateRouter.self) { (r, view: TemplateView) in
            let router = TemplateRouter()
            router.transitionHandler = view

            return router
        }

        container.register(TemplatePresenter.self) { (r, view: TemplateView) in
            let presenter = TemplatePresenter()
            presenter.view = view
            presenter.interactor = r.resolve(TemplateInteractor.self, argument: presenter)
            presenter.router = r.resolve(TemplateRouter.self, argument: view)

            return presenter
        }

        container.storyboardInitCompleted(TemplateView.self) { r, view in
            view.presenter = r.resolve(TemplatePresenter.self, argument: view)
        }
        
    }

}
