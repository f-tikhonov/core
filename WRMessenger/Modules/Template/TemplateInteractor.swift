//
//  TemplateInteractor.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol TemplateInteractorInput: class {

}

protocol TemplateInteractorOutput: class {

}

final class TemplateInteractor {

  weak var presenter: TemplateInteractorOutput!
  var datamanager: TemplateDataManagerInput!

}

// MARK: - TemplateInteractor: TemplateInteractorInput
extension TemplateInteractor: TemplateInteractorInput {
	
}

// MARK: - TemplateInteractor: TemplateDataManagerOutput
extension TemplateInteractor: TemplateDataManagerOutput {
    
}