//
//  RootInteractor.swift
//  WRMessenger
//
//  Created Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol RootInteractorInput: class {

}

protocol RootInteractorOutput: class {

}

final class RootInteractor {

  weak var presenter: RootInteractorOutput!
  var datamanager: RootDataManagerInput!

}

// MARK: - RootInteractor: RootInteractorInput
extension RootInteractor: RootInteractorInput {
	
}

// MARK: - RootInteractor: RootDataManagerOutput
extension RootInteractor: RootDataManagerOutput {
    
}
