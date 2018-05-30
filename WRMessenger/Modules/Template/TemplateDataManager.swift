//
//  TemplateDataManager.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol TemplateDataManagerInput: class {

}

protocol TemplateDataManagerOutput: class {
    
}

final class TemplateDataManager {

    weak var interactor: TemplateDataManagerOutput!

    init() {
        #if DEBUG
        print("TemplateDataManager init()")
        #endif
    }

    deinit {
        #if DEBUG
        print("TemplateDataManager deinit()")
        #endif
    }
}

// MARK: - TemplateDataManager: TemplateDataManagerInput
extension TemplateDataManager: TemplateDataManagerInput {

}