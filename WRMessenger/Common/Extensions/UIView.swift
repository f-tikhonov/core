//
//  Extenstions.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/21/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

extension UIView {
    func addBottomBorder(width: CGFloat = 1, color: UIColor = .white) {
        let border = CALayer()
        
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0,
                              y: frame.size.height - width,
                              width: frame.size.width,
                              height: frame.size.height)
        
        border.borderWidth = width
        
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
