//
//  ContactService.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol ContactServiceInput {
    
}

protocol ContactServiceOutput {
    
}

final class ContactService: ContactServiceInput, ContactServiceOutput {
    
    init() {
        #if DEBUG
        print("ContactService init()")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("ContactService deinit()")
        #endif
    }
    
    // MARK: -
    // MARK: ContactServiceInput
    
    // MARK: -
    // MARK: ContactServiceOutput
}
