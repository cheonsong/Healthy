//
//  Builder.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class Label {
    open var label = UILabel()
    
    public init(_ text: String) {
        label.text = text
    }
    
    open func backgroundColor(_ color: UIColor)-> Label {
        label.backgroundColor = color
        return self
    }
    
    open func font(_ font: UIFont)-> Label {
        label.font = font
        return self
    }
    
    open func text(_ text: String)-> Label {
        label.text = text
        return self
    }
    
    open func textColor(_ color: UIColor)-> Label {
        label.textColor = color
        return self
    }
    
    open func shadowColor(_ shadowColor: UIColor?)-> Label {
        label.shadowColor = shadowColor
        return self
    }

    open func shadowOffset(_ shadowOffset: CGSize)-> Label {
        label.shadowOffset = shadowOffset
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> Label {
        label.textAlignment = textAlignment
        return self
    }
    
    open func lineBreakMode(_ lineBreakMode: NSLineBreakMode)-> Label {
        label.lineBreakMode = lineBreakMode
        return self
    }
    
    open func highlightedTextColor(_ highlightedTextColor: UIColor?)-> Label {
        label.highlightedTextColor = highlightedTextColor
        return self
    }
    
    open func isHighlighted(_ isHighlighted: Bool)-> Label {
        label.isHighlighted = isHighlighted
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Label {
        label.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func isEnabled(_ isEnabled: Bool)-> Label {
        label.isEnabled = isEnabled
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> Label {
        label.numberOfLines = numberOfLines
        return self
    }
    
    @available(iOS 6.0, *)
    open func attributedText(_ attributedText: NSAttributedString)-> Label {
        label.attributedText = attributedText
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> Label {
        label.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> Label {
        label.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> Label {
        label.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> Label  {
        label.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func attributedTextChangeFont(_ text: String, _ font: UIFont, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeColor(_ text: String, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
    
    open func attributedTextChangeFontAndColor(_ text: String, _ font: UIFont, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
}
