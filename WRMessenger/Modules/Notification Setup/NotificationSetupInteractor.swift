//
//  NotificationSetupInteractor.swift
//  WRMessenger
//
//  Created Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol NotificationSetupInteractorInput: class {

}

protocol NotificationSetupInteractorOutput: class {

}

final class NotificationSetupInteractor {

  weak var presenter: NotificationSetupInteractorOutput!
  var datamanager: NotificationSetupDataManagerInput!

}

// MARK: - NotificationSetupInteractor: NotificationSetupInteractorInput
extension NotificationSetupInteractor: NotificationSetupInteractorInput {
	
}

// MARK: - NotificationSetupInteractor: NotificationSetupDataManagerOutput
extension NotificationSetupInteractor: NotificationSetupDataManagerOutput {
    
}