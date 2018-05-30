//
//  AppStyle.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/23/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

struct AppStyle {
    struct Color {
        struct SignIn {
            static let background = AppStyle.Color.mainBlue
            static let navigationTitle = UIColor.white
            static let navigationButton = UIColor.white
        }

        struct SignUp {
            static let background = AppStyle.Color.mainBlue
        }

        static let mainBlue = UIColor(red: 15/255, green: 176/255, blue: 250/255, alpha: 1)

        struct TextField {
            static let placeholder = UIColor.white.withAlphaComponent(0.5)
        }
    }
}

