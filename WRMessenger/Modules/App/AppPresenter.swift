//
//  AppPresenter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol AppModuleInput: class {

}

final class AppPresenter {

    // MARK: - Properties

    weak var view: AppViewInput!
    var interactor: AppInteractorInput!
    var router: AppRouterInput!

    init() {
        #if DEBUG
        print("AppPresenter init()")
        #endif
    }

}

// MARK: - AppViewOutput
extension AppPresenter: AppViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }

}

// MARK: - AppInteractorOutput
extension AppPresenter: AppInteractorOutput {


}

// MARK: - AppModuleInput
extension AppPresenter: AppModuleInput {


}
