//
//  UIViewController.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/22/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Title with message and 'Done' button
    func alert(_ title: String?, message: String?) {
        alert(title, message: message, cancel: nil, buttons: nil, completion: nil)
    }

    /// Title with message, 'Done' button and completion block
    func alert(_ title: String?, message: String?, completion: (() -> Void)?) {
        alert(title, message: message, cancel: nil, buttons: nil, completion: { _ in
            if completion != nil {
                completion!()
            }
        })
    }

    /// Title with message and button title
    func alert(_ title: String?, message: String?, cancel: String?) {
        alert(title, message: message, cancel: cancel, buttons: nil, completion: nil)
    }

    /// Title with message, cancel button title and completion block
    func alert(_ title: String?, message: String?, cancel: String?, completion: (() -> Void)?) {
        alert(title, message: message, cancel: cancel, buttons: nil, completion: { _ in
            if completion != nil {
                completion!()
            }
        })
    }

    /// Title with message, cancel button title, others buttons titles array and completion block
    func alert(_ title: String?, message: String?, cancel: String?, buttons: [String]?, completion: ((UIAlertAction) -> Void)?) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelTitle: String = cancel ?? LS.Global.ok.localized()

        let action: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: { (alertAction) in
            if completion != nil {
                completion!(alertAction)
            }
        })
        alert.addAction(action)

        if buttons != nil {
            for buttonTitle in buttons! {
                let action: UIAlertAction = UIAlertAction(title: buttonTitle, style: .default, handler: { (alertAction) in
                    if completion != nil {
                        completion!(alertAction)
                    }
                })
                alert.addAction(action)
            }
        }

        present(alert, animated: true, completion: nil)
    }

}
