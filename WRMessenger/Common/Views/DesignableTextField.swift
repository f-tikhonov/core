//
//  DesignableTextField.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/23/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit

@IBDesignable class DesignableTextField: UITextField {

    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var textInsetX: CGFloat = 0
    @IBInspectable var textInsetY: CGFloat = 0
    
    @IBInspectable var enableBottomBorder: Bool = false {
        didSet { enableBottomBorder ? addBottomBorder() : nil }
    }

    @IBInspectable var leftImage: UIImage? {
        didSet { updateImage() }
    }

    @IBInspectable var placeholderColor: UIColor = AppStyle.Color.TextField.placeholder {
        didSet { updatePlaceholder() }
    }

    override var placeholder: String? {
        didSet{ updatePlaceholder() }
    }

    // MARK: Padding for text
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textInsetX, dy: textInsetY)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textInsetX, dy: textInsetY)
    }

    // MARK: Padding for image
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }

    // MARK: - Private funcs
    private func updatePlaceholder() {
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "",
                                                   attributes:[NSAttributedStringKey.foregroundColor: placeholderColor])
    }

    private func updateImage() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
    }
}
