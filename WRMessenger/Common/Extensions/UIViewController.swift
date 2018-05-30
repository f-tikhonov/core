//
//  UIViewController.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/22/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

extension UIViewController {

    func setupKeyboardHiding() {
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        hideTap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(hideTap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func setNavigationBackButton(color: UIColor) {
        navigationController?.navigationBar.tintColor = color
    }

    func setNavigationTitle(color: UIColor) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : color]
    }

    // clears navbar's background
    func setNavigationBarTransparent() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

}
