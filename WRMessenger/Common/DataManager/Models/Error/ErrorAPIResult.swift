//
//  ErrorAPIResult.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

//class ErrorAPIResult:  {
//
//    let error: String?
//    let status: Int?
//
//    // MARK: - Decodable
//    private enum RootKeys: String, CodingKey {
//        case result
//    }
//
//    private enum ErrorKeys: String, CodingKey {
//        case error = "error"
//        case status = "status"
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: RootKeys.self)
//        let resultContainer = try container.nestedContainer(keyedBy: ErrorKeys.self, forKey: .result)
//
//        error = try? resultContainer.decode(String.self, forKey: .error)
//        status = try? resultContainer.decode(Int.self, forKey: .status)
//
//        try super.init(from: decoder)
//    }
//
//    // MARK: - Public funcs
//    func getResult() -> ErrorResult {
//        return ErrorResult(error: error, status: status)
//    }
//}


