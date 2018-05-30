//
//  RootPresenter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol RootModuleInput: class {

}

final class RootPresenter {

    // MARK: - Properties
    weak var view: RootViewInput!
    var interactor: RootInteractorInput!
    var router: RootRouterInput!

    init() {
        #if DEBUG
            print("RootPresenter init()")
        #endif
    }

}

// MARK: - RootViewOutput
extension RootPresenter: RootViewOutput {
    func viewIsReady() {
        view.setupInitialState()
        
        if Auth.isAuth {
            router.openMainFlow()
        } else {
            router.openSignIn()
        }
    }
}

// MARK: - RootInteractorOutput
extension RootPresenter: RootInteractorOutput {

}

// MARK: - RootModuleInput
extension RootPresenter: RootModuleInput {

}
