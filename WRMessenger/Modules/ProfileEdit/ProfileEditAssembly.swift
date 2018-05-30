//
//  ProfileEditAssembly.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ProfileEditAssemblyContainer: Assembly {

    func assemble(container: Container) {

        container.register(ProfileEditDataManager.self) { (r, interactor: ProfileEditInteractor) in
            let datamanager = ProfileEditDataManager()
            datamanager.interactor = interactor
        
            return datamanager
        }

        container.register(ProfileEditInteractor.self) { (r, presenter: ProfileEditPresenter) in
            let interactor = ProfileEditInteractor()
            interactor.presenter = presenter
            interactor.datamanager = r.resolve(ProfileEditDataManager.self, argument: interactor)

            return interactor
        }

        container.register(ProfileEditRouter.self) { (r, view: ProfileEditView) in
            let router = ProfileEditRouter()
            router.transitionHandler = view

            return router
        }

        container.register(ProfileEditPresenter.self) { (r, view: ProfileEditView) in
            let presenter = ProfileEditPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(ProfileEditInteractor.self, argument: presenter)
            presenter.router = r.resolve(ProfileEditRouter.self, argument: view)

            return presenter
        }

        container.storyboardInitCompleted(ProfileEditView.self) { r, view in
            view.presenter = r.resolve(ProfileEditPresenter.self, argument: view)
        }
        
    }

}
