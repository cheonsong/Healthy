//
//  Button.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class Button {
    open var button: UIButton
    
    public init(_ button: UIButton = UIButton()) {
        self.button = button
    }
    
    open func backgroundColor(_ color: UIColor)-> Button {
        button.backgroundColor = color
        return self
    }
    
    open func title(_ title: String)-> Button {
        button.setTitle(title, for: .normal)
        return self
    }
    
    open func titleColor(_ color: UIColor)-> Button {
        button.setTitleColor(color, for: .normal)
        return self
    }
    
    open func font(_ font: UIFont)-> Button {
        button.titleLabel?.font = font
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Button {
        button.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> Button {
        button.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> Button {
        button.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    open func isSelected(_ isSelected: Bool)-> Button {
        button.isSelected = isSelected
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> Button {
        button.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> Button {
        button.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> Button {
        button.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> Button  {
        button.layer.masksToBounds = masksToBounds
        return self
    }
    
}
