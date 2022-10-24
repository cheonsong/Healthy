//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

open class ImageView {
    open var imageView = UIImageView()
    
    public init() {}
    
    public init (_ named: String) {
        self.imageView.image = UIImage(named: named)
    }
    
    public init (_ image: UIImage) {
        self.imageView.image = image
    }
    
    open func image(_ image: UIImage)-> ImageView {
        imageView.image = image
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> ImageView {
        imageView.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ImageView {
        imageView.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> ImageView {
        imageView.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ImageView {
        imageView.isHidden = isHidden
        return self
    }
    
    open func tag(_ tag: Int)-> ImageView {
        imageView.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ImageView {
        imageView.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ImageView {
        imageView.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ImageView  {
        imageView.layer.masksToBounds = masksToBounds
        return self
    }
}
