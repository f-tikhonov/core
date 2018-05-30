//
//  MessageService.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 22.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

protocol MessageServiceInput {
    
}

protocol MessageServiceOutput {
    
}

final class MessageService: MessageServiceInput, MessageServiceOutput {
    
    init() {
        #if DEBUG
        print("MessageService init()")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("MessageService deinit()")
        #endif
    }
    
    // MARK: -
    // MARK: MessageServiceInput
    
    // MARK: -
    // MARK: MessageServiceOutput
}
