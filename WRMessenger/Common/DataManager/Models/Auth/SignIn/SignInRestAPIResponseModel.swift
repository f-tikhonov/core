//
//  Auth.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 24.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SignInRestAPIResponseModel: Decodable {
    
    // FIXME: - Раскомментировать timestamp, когда будет реализовано на сервере
    let success: Bool
    //  let timestamp: String

    let tokenIdentifier: String?
    let accessToken: String?
    let userIdentifier: String?

    // MARK: - Decodable
    private enum RootKeys: String, CodingKey {
        case success
        //    case timestamp
        case result
    }

    private enum ResultKeys: String, CodingKey {
        case token = "wrm_token"
    }

    private enum TokenKeys: String, CodingKey {
        case tokenIdentifier = "wrm_token_id"
        case accessToken = "wrm_token_access_token"
        case userIdentifier = "wrm_token_user_id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        //    timestamp = try container.decode(String.self, forKey: .timestamp)

        let resultContainer = try container.nestedContainer(keyedBy: ResultKeys.self, forKey: .result)
        let tokenContaciner = try resultContainer.nestedContainer(keyedBy: TokenKeys.self, forKey: .token)

        tokenIdentifier = try? tokenContaciner.decode(String.self, forKey: .tokenIdentifier)
        accessToken = try? tokenContaciner.decode(String.self, forKey: .accessToken)
        userIdentifier = try? tokenContaciner.decode(String.self, forKey: .userIdentifier)
    }
}
