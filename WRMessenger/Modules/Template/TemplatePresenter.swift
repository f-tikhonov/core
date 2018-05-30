//
//  TemplatePresenter.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

protocol TemplateModuleInput: class {

}

final class TemplatePresenter {

    // MARK: - Properties

    weak var view: TemplateViewInput!
    var interactor: TemplateInteractorInput!
    var router: TemplateRouterInput!

    init() {
        #if DEBUG
        print("TemplatePresenter init()")
        #endif
    }

}

// MARK: - TemplateViewOutput
extension TemplatePresenter: TemplateViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }

}

// MARK: - TemplateInteractorOutput
extension TemplatePresenter: TemplateInteractorOutput {


}

// MARK: - TemplateModuleInput
extension TemplatePresenter: TemplateModuleInput {


}
