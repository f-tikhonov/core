//
//  UserSocketAPI.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 23.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Moya

enum UserSocketAPI {
    case info(user_id: String)
    case update(user_id: String)
}

extension UserSocketAPI: TargetType {
    
    var headers: [String : String]? {
        //        return ["Accept": "application/json", "Content-Type": "application/json", "User-Language": "\(Locale.current.languageCode!)"]
        return nil
    }
    
    var baseURL: URL { return URL(string: Remote.serverApiUrl)!}
    
    var path: String {
        switch self {
        case .info:
            return "wrm/uas/user/auth"
        case .update:
            return "wrm/user/create"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .info:
            return .post
        case .update:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .info(let user_id):
            var parameters = [String: Any]()
            parameters["uas_user_id"] = user_id
            parameters["timestamp"] = Int(Date().timeIntervalSince1970)
            return parameters
        case .update:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        //        switch self {
        //            case .signIn(let login, let password, let uuid):
        //                let userJson = [
        //                    "email": login,
        //                    "password": password,
        //                    "uuid": uuid
        //                    ]
        //                return jsonSerializedUTF8(json: userJson)
        //            case .signUp:
        //                return Data()
        //        }
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .info:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .update:
            return .requestPlain
        }
    }
    
    //    private func jsonSerializedUTF8(json: [String: Any]) -> Data {
    //        return try! JSONSerialization.data(
    //            withJSONObject: json,
    //            options: [.prettyPrinted]
    //        )
    //    }
}
