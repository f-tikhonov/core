//
//  ProfileInteractor.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol ProfileInteractorInput: class {

}

protocol ProfileInteractorOutput: class {

}

final class ProfileInteractor {

  weak var presenter: ProfileInteractorOutput!
  var datamanager: ProfileDataManagerInput!

}

// MARK: - ProfileInteractor: ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
	
}

// MARK: - ProfileInteractor: ProfileDataManagerOutput
extension ProfileInteractor: ProfileDataManagerOutput {
    
}