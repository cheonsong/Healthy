//
//  Button.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class Button {
    open var view: UIButton
    
    public init(_ button: UIButton = UIButton()) {
        self.view = button
    }
    
    open func backgroundColor(_ color: UIColor)-> Button {
        view.backgroundColor = color
        return self
    }
    
    open func title(_ title: String)-> Button {
        view.setTitle(title, for: .normal)
        return self
    }
    
    open func titleColor(_ color: UIColor)-> Button {
        view.setTitleColor(color, for: .normal)
        return self
    }
    
    open func font(_ font: UIFont)-> Button {
        view.titleLabel?.font = font
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Button {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> Button {
        view.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> Button {
        view.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    open func isSelected(_ isSelected: Bool)-> Button {
        view.isSelected = isSelected
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> Button {
        view.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> Button {
        view.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> Button {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> Button  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> Button {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> Button {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func image(_ image: UIImage)-> Button {
        view.setImage(image, for: .normal)
        return self
    }
    
}
