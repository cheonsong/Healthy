//
//  Builder.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

public class Label {
    public var label = UILabel()
    
    public init(_ text: String) {
        label.text = text
    }
    
    public func backgroundColor(_ color: UIColor)-> Label {
        label.backgroundColor = color
        return self
    }
    
    public func font(_ font: UIFont)-> Label {
        label.font = font
        return self
    }
    
    public func text(_ text: String)-> Label {
        label.text = text
        return self
    }
    
    public func textColor(_ color: UIColor)-> Label {
        label.textColor = color
        return self
    }
    
    public func shadowColor(_ shadowColor: UIColor?)-> Label {
        label.shadowColor = shadowColor
        return self
    }

    public func shadowOffset(_ shadowOffset: CGSize)-> Label {
        label.shadowOffset = shadowOffset
        return self
    }
    
    public func textAlignment(_ textAlignment: NSTextAlignment)-> Label {
        label.textAlignment = textAlignment
        return self
    }
    
    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode)-> Label {
        label.lineBreakMode = lineBreakMode
        return self
    }
    
    public func highlightedTextColor(_ highlightedTextColor: UIColor?)-> Label {
        label.highlightedTextColor = highlightedTextColor
        return self
    }
    
    public func isHighlighted(_ isHighlighted: Bool)-> Label {
        label.isHighlighted = isHighlighted
        return self
    }
    
    public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Label {
        label.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    public func isEnabled(_ isEnabled: Bool)-> Label {
        label.isEnabled = isEnabled
        return self
    }
    
    public func numberOfLines(_ numberOfLines: Int)-> Label {
        label.numberOfLines = numberOfLines
        return self
    }
    
    @available(iOS 6.0, *)
    public func attributedText(_ attributedText: NSAttributedString)-> Label {
        label.attributedText = attributedText
        return self
    }
    
    public func isHidden(_ isHidden: Bool)-> Label {
        label.isHidden = isHidden
        return self
    }
    
    public func alpha(_ alpha: CGFloat)-> Label {
        label.alpha = alpha
        return self
    }
    
    public func cornerRadius(_ cornerRadius: CGFloat)-> Label {
        label.layer.cornerRadius = cornerRadius
        return self
    }
    
    public func masksToBounds(_ masksToBounds: Bool)-> Label  {
        label.layer.masksToBounds = masksToBounds
        return self
    }
    
    public func attributedTextChangeFont(_ text: String, _ font: UIFont, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
    
    public func attributedTextChangeColor(_ text: String, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
    
    public func attributedTextChangeFontAndColor(_ text: String, _ font: UIFont, _ color: UIColor, _ range: [String])-> Label {
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        label.attributedText = attributedStr
        return self
    }
}
