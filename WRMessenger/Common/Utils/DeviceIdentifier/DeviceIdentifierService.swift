//
//  DeviceIdentifierService.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/25/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation
import KeychainAccess

protocol DeviceIdentifierServiceInput {
    func deviceIdentifier() -> String
}

class DeviceIdentifierService {
    var keychain: Keychain!

    fileprivate func generateDeviceIdentifier() -> String {
        return UUID().uuidString
    }
}

// MARK: - DeviceIdentifierService
extension DeviceIdentifierService: DeviceIdentifierServiceInput {
    func deviceIdentifier() -> String {
        let generatedIdentifier = try? keychain.get(KeychainContasts.deviceIdentifierKey)

        guard let identifier = generatedIdentifier,
              let id = identifier else {
            let newIdentifier = generateDeviceIdentifier()
            try? keychain.set(newIdentifier, key: KeychainContasts.deviceIdentifierKey)
            return newIdentifier
        }

        return id
    }
}
