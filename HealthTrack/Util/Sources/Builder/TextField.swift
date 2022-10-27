//
//  TextField.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class TextField {
    open var view = UITextField()
    
    public init (_ view: UITextField = UITextField()) {
        self.view = view
    }
    
    open func delegate(_ delegate: UITextFieldDelegate?)-> TextField {
        view.delegate = delegate
        return self
    }
    
    open func text(_ text: String?)-> TextField {
        view.text = text
        return self
    }
    
    open func attributedText(_ attributedText: NSAttributedString?)-> TextField {
        view.attributedText = attributedText
        return self
    }
    
    open func placeholder(_ placeholder: String?)-> TextField {
        view.placeholder = placeholder
        return self
    }
    
    open func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?)-> TextField {
        view.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    open func font(_ font: UIFont?)-> TextField {
        view.font = font
        return self
    }
    
    open func textColor(_ textColor: UIColor?)-> TextField {
        view.textColor = textColor
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> TextField {
        view.textAlignment = textAlignment
        return self
    }
    
    open func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool)-> TextField {
        view.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    open func minimumFontSize(_ minimumFontSize: CGFloat)-> TextField {
        view.minimumFontSize = minimumFontSize
        return self
    }
    
    open func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool)-> TextField {
        view.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    
    open func clearsOnInsertion(_ clearsOnInsertion: Bool)-> TextField {
        view.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    open func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool)-> TextField {
        view.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    open func borderStyle(_ borderStyle: UITextField.BorderStyle)-> TextField {
        view.borderStyle = borderStyle
        return self
    }
    
    open func background(_ background: UIImage?)-> TextField {
        view.background = background
        return self
    }
    
    open func leftView(_ leftView: UIView?)-> TextField {
        view.leftView = leftView
        return self
    }
    
    open func rightView(_ rightView: UIView?)-> TextField {
        view.rightView = rightView
        return self
    }
    
    open func leftViewMode(_ leftViewMode: UITextField.ViewMode)-> TextField {
        view.leftViewMode = leftViewMode
        return self
    }
    
    open func rightViewMode(_ rightViewMode: UITextField.ViewMode)-> TextField {
        view.rightViewMode = rightViewMode
        return self
    }
    
    open func inputView(_ inputView: UIView?)-> TextField {
        view.inputView = inputView
        return self
    }
    
    open func inputAccessoryView(_ inputAccessoryView: UIView?)-> TextField {
        view.inputAccessoryView = inputAccessoryView
        return self
    }
    
    open func disabledBackground(_ disabledBackground: UIImage?)-> TextField {
        view.disabledBackground = disabledBackground
        return self
    }
    
    open func clearButtonMode(_ clearButtonMode: UITextField.ViewMode)-> TextField {
        view.clearButtonMode = clearButtonMode
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> TextField {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> TextField {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> TextField {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> TextField {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UITextField.ContentMode)-> TextField {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> TextField {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> TextField {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> TextField {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> TextField  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> TextField {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> TextField {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> TextField {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UITextField.TintAdjustmentMode)-> TextField {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> TextField {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> TextField {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UITextField?)-> TextField {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> TextField {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> TextField {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> TextField {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> TextField {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> TextField {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> TextField {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> TextField {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> TextField {
        view.anchorPoint = anchorPoint
        return self
    }
}
