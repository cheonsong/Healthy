//
//  Builder.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class Label {
    open var view = UILabel()
    
    public init() {}
    
    public init(_ text: String) {
        view.text = text
    }
    
    open func backgroundColor(_ color: UIColor)-> Label {
        view.backgroundColor = color
        return self
    }
    
    open func font(_ font: UIFont)-> Label {
        view.font = font
        return self
    }
    
    open func text(_ text: String)-> Label {
        view.text = text
        return self
    }
    
    open func textColor(_ color: UIColor)-> Label {
        view.textColor = color
        return self
    }
    
    open func shadowColor(_ shadowColor: UIColor?)-> Label {
        view.shadowColor = shadowColor
        return self
    }

    open func shadowOffset(_ shadowOffset: CGSize)-> Label {
        view.shadowOffset = shadowOffset
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> Label {
        view.textAlignment = textAlignment
        return self
    }
    
    open func lineBreakMode(_ lineBreakMode: NSLineBreakMode)-> Label {
        view.lineBreakMode = lineBreakMode
        return self
    }
    
    open func highlightedTextColor(_ highlightedTextColor: UIColor?)-> Label {
        view.highlightedTextColor = highlightedTextColor
        return self
    }
    
    open func isHighlighted(_ isHighlighted: Bool)-> Label {
        view.isHighlighted = isHighlighted
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Label {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func isEnabled(_ isEnabled: Bool)-> Label {
        view.isEnabled = isEnabled
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> Label {
        view.numberOfLines = numberOfLines
        return self
    }
    
    @available(iOS 6.0, *)
    open func attributedText(_ attributedText: NSAttributedString)-> Label {
        view.attributedText = attributedText
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> Label {
        view.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> Label {
        view.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> Label {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> Label  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func attributedTextChangeFont(_ text: String, _ font: UIFont, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeColor(_ text: String, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeFontAndColor(_ text: String, _ font: UIFont, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> Label {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> Label {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> Label {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> Label {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> Label {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> Label {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> Label {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> Label {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> Label {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> Label {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> Label {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> Label {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> Label {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> Label {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> Label {
        view.anchorPoint = anchorPoint
        return self
    }
    
    open func sizeToFit()-> Label {
        view.sizeToFit()
        return self
    }
}
