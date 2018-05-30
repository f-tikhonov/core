//
//  NotificationSetupPresenter.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol NotificationSetupModuleInput: class {

}

final class NotificationSetupPresenter {

    // MARK: - Properties

    weak var view: NotificationSetupViewInput!
    var interactor: NotificationSetupInteractorInput!
    var router: NotificationSetupRouterInput!

    init() {
        #if DEBUG
        print("NotificationSetupPresenter init()")
        #endif
    }

}

// MARK: - NotificationSetupViewOutput
extension NotificationSetupPresenter: NotificationSetupViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }

}

// MARK: - NotificationSetupInteractorOutput
extension NotificationSetupPresenter: NotificationSetupInteractorOutput {


}

// MARK: - NotificationSetupModuleInput
extension NotificationSetupPresenter: NotificationSetupModuleInput {


}
