//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

open class ImageView {
    open var view = UIImageView()
    
    public init() {}
    
    public init (_ named: String) {
        self.view.image = UIImage(named: named)
    }
    
    public init (_ image: UIImage) {
        self.view.image = image
    }
    
    open func image(_ image: UIImage)-> ImageView {
        view.image = image
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> ImageView {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ImageView {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> ImageView {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ImageView {
        view.isHidden = isHidden
        return self
    }
    
    open func tag(_ tag: Int)-> ImageView {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ImageView {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ImageView {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ImageView  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> ImageView {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> ImageView {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
}
