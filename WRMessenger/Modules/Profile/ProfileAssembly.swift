//
//  ProfileAssembly.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ProfileAssemblyContainer: Assembly {

    func assemble(container: Container) {

        container.register(ProfileDataManager.self) { (r, interactor: ProfileInteractor) in
            let datamanager = ProfileDataManager()
            datamanager.interactor = interactor
        
            return datamanager
        }

        container.register(ProfileInteractor.self) { (r, presenter: ProfilePresenter) in
            let interactor = ProfileInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(ProfileDataManager.self, argument: interactor)

            return interactor
        }

        container.register(ProfileRouter.self) { (r, view: ProfileView) in
            let router = ProfileRouter()
            router.transitionHandler = view

            return router
        }

        container.register(ProfilePresenter.self) { (r, view: ProfileView) in
            let presenter = ProfilePresenter()
            presenter.view = view
            presenter.interactor = r.resolve(ProfileInteractor.self, argument: presenter)
            presenter.router = r.resolve(ProfileRouter.self, argument: view)

            return presenter
        }

        container.storyboardInitCompleted(ProfileView.self) { r, view in
            view.presenter = r.resolve(ProfilePresenter.self, argument: view)
        }
        
    }

}
