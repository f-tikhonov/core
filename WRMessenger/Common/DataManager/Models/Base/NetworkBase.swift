//
//  ResponseBaseModel.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/24/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

enum NetworkType: String, Decodable {
    case request
    case response
}

// MARK: - Base Socket Request
protocol BaseSocketRequest {
    var version: Int { get }
    var type: NetworkType { get }
    var cmd: String { get }
    var id: String { get }
}

extension BaseSocketRequest {
    var id: String {
        Remote.id += 1
        return String(Remote.id)
    }
}

// MARK: - Base Socket Response
protocol BaseSocketResponse {
    var version: Int { get }
    var type: NetworkType { get }
    var responseID: String { get }
    var status: Bool { get }
}
