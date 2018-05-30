//
//  ProfileEditInteractor.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol ProfileEditInteractorInput: class {

}

protocol ProfileEditInteractorOutput: class {

}

final class ProfileEditInteractor {

  weak var presenter: ProfileEditInteractorOutput!
  var datamanager: ProfileEditDataManagerInput!

}

// MARK: - ProfileEditInteractor: ProfileEditInteractorInput
extension ProfileEditInteractor: ProfileEditInteractorInput {
	
}

// MARK: - ProfileEditInteractor: ProfileEditDataManagerOutput
extension ProfileEditInteractor: ProfileEditDataManagerOutput {
    
}