//
//  Builder.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class LabelBuilder {
    open var view = UILabel()
    
    public init() {}
    
    public init(_ text: String) {
        view.text = text
    }
    
    open func backgroundColor(_ color: UIColor)-> LabelBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func font(_ font: UIFont)-> LabelBuilder {
        view.font = font
        return self
    }
    
    open func text(_ text: String)-> LabelBuilder {
        view.text = text
        return self
    }
    
    open func textColor(_ color: UIColor)-> LabelBuilder {
        view.textColor = color
        return self
    }
    
    open func shadowColor(_ shadowColor: UIColor?)-> LabelBuilder {
        view.shadowColor = shadowColor
        return self
    }

    open func shadowOffset(_ shadowOffset: CGSize)-> LabelBuilder {
        view.shadowOffset = shadowOffset
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> LabelBuilder {
        view.textAlignment = textAlignment
        return self
    }
    
    open func lineBreakMode(_ lineBreakMode: NSLineBreakMode)-> LabelBuilder {
        view.lineBreakMode = lineBreakMode
        return self
    }
    
    open func highlightedTextColor(_ highlightedTextColor: UIColor?)-> LabelBuilder {
        view.highlightedTextColor = highlightedTextColor
        return self
    }
    
    open func isHighlighted(_ isHighlighted: Bool)-> LabelBuilder {
        view.isHighlighted = isHighlighted
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> LabelBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func isEnabled(_ isEnabled: Bool)-> LabelBuilder {
        view.isEnabled = isEnabled
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> LabelBuilder {
        view.numberOfLines = numberOfLines
        return self
    }
    
    @available(iOS 6.0, *)
    open func attributedText(_ attributedText: NSAttributedString)-> LabelBuilder {
        view.attributedText = attributedText
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> LabelBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> LabelBuilder {
        view.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> LabelBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> LabelBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func attributedTextChangeFont(_ text: String, _ font: UIFont, _ range: [String])-> LabelBuilder {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeColor(_ text: String, _ color: UIColor, _ range: [String])-> LabelBuilder {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeFontAndColor(_ text: String, _ font: UIFont, _ color: UIColor, _ range: [String])-> LabelBuilder {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        view.attributedText = attributedStr
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> LabelBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> LabelBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> LabelBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> LabelBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> LabelBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> LabelBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> LabelBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> LabelBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> LabelBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> LabelBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> LabelBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> LabelBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> LabelBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> LabelBuilder {
        view.transform3D = transform3D
        return self
    }
    
    open func sizeToFit()-> LabelBuilder {
        view.sizeToFit()
        return self
    }
}
