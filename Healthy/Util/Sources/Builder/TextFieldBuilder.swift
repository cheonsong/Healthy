//
//  TextField.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class TextFieldBuilder {
    open var view = UITextField()
    
    public init (_ view: UITextField = UITextField()) {
        self.view = view
    }
    
    open func delegate(_ delegate: UITextFieldDelegate?)-> TextFieldBuilder {
        view.delegate = delegate
        return self
    }
    
    open func text(_ text: String?)-> TextFieldBuilder {
        view.text = text
        return self
    }
    
    open func attributedText(_ attributedText: NSAttributedString?)-> TextFieldBuilder {
        view.attributedText = attributedText
        return self
    }
    
    open func placeholder(_ placeholder: String?)-> TextFieldBuilder {
        view.placeholder = placeholder
        return self
    }
    
    open func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?)-> TextFieldBuilder {
        view.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    open func font(_ font: UIFont?)-> TextFieldBuilder {
        view.font = font
        return self
    }
    
    open func textColor(_ textColor: UIColor?)-> TextFieldBuilder {
        view.textColor = textColor
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> TextFieldBuilder {
        view.textAlignment = textAlignment
        return self
    }
    
    open func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool)-> TextFieldBuilder {
        view.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    open func minimumFontSize(_ minimumFontSize: CGFloat)-> TextFieldBuilder {
        view.minimumFontSize = minimumFontSize
        return self
    }
    
    open func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool)-> TextFieldBuilder {
        view.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    
    open func clearsOnInsertion(_ clearsOnInsertion: Bool)-> TextFieldBuilder {
        view.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    open func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool)-> TextFieldBuilder {
        view.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    open func borderStyle(_ borderStyle: UITextField.BorderStyle)-> TextFieldBuilder {
        view.borderStyle = borderStyle
        return self
    }
    
    open func background(_ background: UIImage?)-> TextFieldBuilder {
        view.background = background
        return self
    }
    
    open func leftView(_ leftView: UIView?)-> TextFieldBuilder {
        view.leftView = leftView
        return self
    }
    
    open func rightView(_ rightView: UIView?)-> TextFieldBuilder {
        view.rightView = rightView
        return self
    }
    
    open func leftViewMode(_ leftViewMode: UITextField.ViewMode)-> TextFieldBuilder {
        view.leftViewMode = leftViewMode
        return self
    }
    
    open func rightViewMode(_ rightViewMode: UITextField.ViewMode)-> TextFieldBuilder {
        view.rightViewMode = rightViewMode
        return self
    }
    
    open func inputView(_ inputView: UIView?)-> TextFieldBuilder {
        view.inputView = inputView
        return self
    }
    
    open func inputAccessoryView(_ inputAccessoryView: UIView?)-> TextFieldBuilder {
        view.inputAccessoryView = inputAccessoryView
        return self
    }
    
    open func disabledBackground(_ disabledBackground: UIImage?)-> TextFieldBuilder {
        view.disabledBackground = disabledBackground
        return self
    }
    
    open func clearButtonMode(_ clearButtonMode: UITextField.ViewMode)-> TextFieldBuilder {
        view.clearButtonMode = clearButtonMode
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> TextFieldBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> TextFieldBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> TextFieldBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> TextFieldBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UITextField.ContentMode)-> TextFieldBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> TextFieldBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> TextFieldBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> TextFieldBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> TextFieldBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> TextFieldBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> TextFieldBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> TextFieldBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UITextField.TintAdjustmentMode)-> TextFieldBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> TextFieldBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> TextFieldBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UITextField?)-> TextFieldBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> TextFieldBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> TextFieldBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> TextFieldBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> TextFieldBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> TextFieldBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> TextFieldBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> TextFieldBuilder {
        view.transform3D = transform3D
        return self
    }
}
