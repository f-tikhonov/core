//
//  AppInteractor.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol AppInteractorInput: class {

}

protocol AppInteractorOutput: class {

}

final class AppInteractor {

  weak var presenter: AppInteractorOutput!
  var datamanager: AppDataManagerInput!

}

// MARK: - AppInteractor: AppInteractorInput
extension AppInteractor: AppInteractorInput {
	
}

// MARK: - AppInteractor: AppDataManagerOutput
extension AppInteractor: AppDataManagerOutput {
    
}