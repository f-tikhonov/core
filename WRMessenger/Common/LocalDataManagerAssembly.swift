//
//  LocalDataManagerAssembly.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Swinject
import KeychainAccess

final class LocalDataManagerAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(AuthService.self) { r in
            let service = AuthService()
            
            return service
            }.inObjectScope(.container)
        
        container.register(UserService.self) { r in
            let service = UserService()
            
            return service
            }.inObjectScope(.container)
        
        container.register(ContactService.self) { r in
            let service = ContactService()
            
            return service
            }.inObjectScope(.container)
        
        container.register(MessageService.self) { r in
            let service = MessageService()
            
            return service
            }.inObjectScope(.container)

        container.register(DeviceIdentifierService.self) { r in
            let service = DeviceIdentifierService()
            service.keychain = Keychain()

            return service
            }.inObjectScope(.container)
    }
}
