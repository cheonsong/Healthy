//
//  Button.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

public class Button {
    public var button = UIButton()
    
    public func backgroundColor(_ color: UIColor)-> Button {
        button.backgroundColor = color
        return self
    }
    
    public func title(_ title: String)-> Button {
        button.setTitle(title, for: .normal)
        return self
    }
    
    public func titleColor(_ color: UIColor)-> Button {
        button.setTitleColor(color, for: .normal)
        return self
    }
    
    public func font(_ font: UIFont)-> Button {
        button.titleLabel?.font = font
        return self
    }
    
    public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Button {
        button.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    public func textAlignment(_ textAlignment: NSTextAlignment)-> Button {
        button.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    public func numberOfLines(_ numberOfLines: Int)-> Button {
        button.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    public func isSelected(_ isSelected: Bool)-> Button {
        button.isSelected = isSelected
        return self
    }
    
    public func isHidden(_ isHidden: Bool)-> Button {
        button.isHidden = isHidden
        return self
    }
    
    public func alpha(_ alpha: CGFloat)-> Button {
        button.alpha = alpha
        return self
    }
    
    public func cornerRadius(_ cornerRadius: CGFloat)-> Button {
        button.layer.cornerRadius = cornerRadius
        return self
    }
    
    public func masksToBounds(_ masksToBounds: Bool)-> Button  {
        button.layer.masksToBounds = masksToBounds
        return self
    }
    
}
