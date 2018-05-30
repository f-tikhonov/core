//
//  AuthRestService.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 30.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation
import Moya

final class AuthRestService {
    let provider = MoyaProvider<AuthRestAPI>() //plugins: [NetworkLoggerPlugin(verbose: true)])
    
    init() {
        #if DEBUG
        print("AuthRestService init()")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("AuthRestService deinit()")
        #endif
    }
    
}

// MARK: - AuthServiceInput
extension AuthRestService: AuthServiceInput {
    
    func signIn(login: String,
                password: String,
                uuid: String,
                successCallback: @escaping ((SignInRestAPIResponseModel) -> Void),
                errorCallback: @escaping (String) -> Void) {
        
        provider.request(.signIn(login: login, password: password, uuid: uuid)) { response in
            switch response {
            case .success(let result):
                guard let baseResult = try? JSONDecoder().decode(SignInRestAPIResponseModel.self, from: result.data) else { return }
                
                print(baseResult.success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signUp(login: String,
                password: String,
                firstName: String,
                middleName: String?,
                lastName: String,
                uuid: String) {
        
        provider.request(.signUp(login: login, password: password, firstName: firstName, middleName: middleName, lastName: lastName, uuid: uuid)) { (response) in
            switch response {
            case .success(let result):
                print(result)
                //                let result = try? JSONDecoder().decode(Auth.self, from: result.data)
                //
                //                guard let userID = result?.userIdentifier,
                //                      let token = result?.accessToken else { return }
                //                Auth.user = userID
                //                Auth.password = password
            //                Auth.token = token
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: -
// MARK: AuthServiceOutput
extension AuthRestService: AuthServiceOutput {
    
}
