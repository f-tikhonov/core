//
//  SegueConstants.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/23/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation

struct SegueFrom {
    struct RootTo {
        static let signIn = "showRootToLoginSegue"
        static let mainApp = "showRootToMainAppSegue"
    }

    struct SignInTo {
        static let signUp = "showSignInToSignUpSegue"
        static let mainApp = "showSignInToMainAppSegue"
    }

    struct ProfileTo {
        static let notificationSetup = "showProfileToNotificationSetupSegue"
        static let profileEdit = "showProfileToProfileEditSegue"
    }
}

