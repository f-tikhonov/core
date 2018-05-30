//
//  UIColor+Hex.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 30.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(string: String, alpha: CGFloat = 1) {
        
        var uppercasedString = string.uppercased()
        uppercasedString.remove(at: string.startIndex)
        
        var rgbValue: UInt32 = 0
        Scanner(string: uppercasedString).scanHexInt32(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
