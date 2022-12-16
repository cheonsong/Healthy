//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

open class TextViewBuilder {
    open var view = UITextView()
    
    public init (_ view: UITextView = UITextView()) {
        self.view = view
    }
    
    open func delegate(_ delegate: UITextViewDelegate)-> TextViewBuilder {
        view.delegate = delegate
        return self
    }
    
    open func text(_ text: String)-> TextViewBuilder {
        view.text = text
        return self
    }
    
    open func attributedText(_ attributedText: NSAttributedString)-> TextViewBuilder {
        view.attributedText = attributedText
        return self
    }
    
    open func font(_ font: UIFont?)-> TextViewBuilder {
        view.font = font
        return self
    }
    
    open func textColor(_ textColor: UIColor?)-> TextViewBuilder {
        view.textColor = textColor
        return self
    }
    
    open func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes)-> TextViewBuilder {
        view.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    open func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any])-> TextViewBuilder {
        view.typingAttributes = typingAttributes
        return self
    }
    
    open func linkTextAttributes(_ linkTextAttributes: [NSAttributedString.Key : Any])-> TextViewBuilder {
        view.linkTextAttributes = linkTextAttributes
        return self
    }
    
    open func textContainerInset(_ textContainerInset: UIEdgeInsets)-> TextViewBuilder {
        view.textContainerInset = textContainerInset
        return self
    }
    
    open func usesStandardTextScaling(_ usesStandardTextScaling: Bool)-> TextViewBuilder {
        view.usesStandardTextScaling = usesStandardTextScaling
        return self
    }
    
    open func isEditable(_ isEditable: Bool)-> TextViewBuilder {
        view.isEditable = isEditable
        return self
    }
    
    open func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool)-> TextViewBuilder {
        view.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> TextViewBuilder {
        view.textAlignment = textAlignment
        return self
    }
    
    open func selectedRange(_ selectedRange: NSRange)-> TextViewBuilder {
        view.selectedRange = selectedRange
        return self
    }
    
    open func clearsOnInsertion(_ clearsOnInsertion: Bool)-> TextViewBuilder {
        view.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    open func isSelectable(_ isSelectable: Bool)-> TextViewBuilder {
        view.isSelectable = isSelectable
        return self
    }
    
    open func inputView(_ inputView: UIView?)-> TextViewBuilder {
        view.inputView = inputView
        return self
    }
    
    open func inputAccessoryView(_ inputAccessoryView: UIView?)-> TextViewBuilder {
        view.inputAccessoryView = inputAccessoryView
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> TextViewBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> TextViewBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> TextViewBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> TextViewBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> TextViewBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> TextViewBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> TextViewBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> TextViewBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> TextViewBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> TextViewBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> TextViewBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> TextViewBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> TextViewBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> TextViewBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> TextViewBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> TextViewBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> TextViewBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> TextViewBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> TextViewBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> TextViewBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> TextViewBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> TextViewBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> TextViewBuilder {
        view.transform3D = transform3D
        return self
    }
}
