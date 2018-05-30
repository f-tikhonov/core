//
//  AuthRestAPI.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/29/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Moya

enum AuthRestAPI {
    case signIn(login: String,
        password: String,
        uuid: String)

    case signUp(login: String,
        password: String,
        firstName: String,
        middleName: String?,
        lastName: String,
        uuid: String)
}

extension AuthRestAPI: TargetType {

    var headers: [String : String]? {
        //        return ["Accept": "application/json", "Content-Type": "application/json", "User-Language": "\(Locale.current.languageCode!)"]
        return nil
    }

    var baseURL: URL { return URL(string: Remote.serverApiUrl)!}

    var path: String {
        switch self {
        case .signIn:
            return AppURL.REST.User.signIn
        case .signUp:
            return AppURL.REST.User.signUp
        }
    }

    var method: Moya.Method {
        switch self {
        case .signIn, .signUp:
            return .post
        }
    }

    //    var parameters: [String: Any]? {
    //        switch self {
    //            case .signIn(let login, let password, let uuid):
    //                var user = [String : Any]()
    //                user["uas_user_email"] = login
    //                user["uas_user_password"] = password
    //
    //                var data = [String: Any]()
    //                data["uas_user"] = user
    //                data["wrm_uuid"] = uuid
    //
    //                var parameters = [String: Any]()
    //                parameters["data"] = data
    //                parameters["timestamp"] = Int(Date().timeIntervalSince1970)
    //                return parameters
    //        case .signUp(let login, let password, let firstName, let middleName, let lastName, let uuid):
    //                var user = [String : Any]()
    //                user.updateValue(login, forKey: "wrm_user_login")
    //                user.updateValue(password, forKey: "wrm_user_password")
    //                user.updateValue(firstName, forKey: "wrm_user_first_name")
    //                user.updateValue(lastName, forKey: "wrm_user_last_name")
    //
    //                if let middleName = middleName {
    //                    user.updateValue(middleName, forKey: "wrm_user_middle_name")
    //                }
    //
    //                var data = [String: Any]()
    //                data.updateValue(user, forKey: "wrm_user")
    //                data["wrm_uuid"] = uuid
    //
    //                var parameters = [String: Any]()
    //                parameters.updateValue(data, forKey: "data")
    //                parameters.updateValue(Int(Date().timeIntervalSince1970), forKey: "timestamp")
    //                return parameters
    //        }
    //    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        switch self {
        case .signIn(let login, let password, let uuid):
            let model = SignInRestAPIRequestModel(login: login, password: password, uuid: uuid)
            if let data = try? JSONEncoder().encode(model) {
                return data
            }
        case .signUp:
            return Data()
        }
        return "".data(using: .utf8)!
    }

    var task: Task {
        switch self {
        case .signIn, .signUp:
            //            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
            return .requestData(sampleData)
        }
    }
}
