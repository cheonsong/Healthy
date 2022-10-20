//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

public class ImageView {
    public var imageView = UIImageView()
    
    public init (_ named: String) {
        self.imageView.image = UIImage(named: named)
    }
    
    public init (_ image: UIImage) {
        self.imageView.image = image
    }
    
    public func image(_ image: UIImage)-> ImageView {
        imageView.image = image
        return self
    }
    
    public func backgrouondColor(_ color: UIColor)-> ImageView {
        imageView.backgroundColor = color
        return self
    }
    
    public func alpha(_ alpha: CGFloat)-> ImageView {
        imageView.alpha = alpha
        return self
    }
    
    public func isOpaque(_ isOpaque: Bool)-> ImageView {
        imageView.isOpaque = isOpaque
        return self
    }
    
    public func isHidden(_ isHidden: Bool)-> ImageView {
        imageView.isHidden = isHidden
        return self
    }
    
    public func tag(_ tag: Int)-> ImageView {
        imageView.tag = tag
        return self
    }
    
    public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ImageView {
        imageView.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    public func cornerRadius(_ cornerRadius: CGFloat)-> ImageView {
        imageView.layer.cornerRadius = cornerRadius
        return self
    }
    
    public func masksToBounds(_ masksToBounds: Bool)-> ImageView  {
        imageView.layer.masksToBounds = masksToBounds
        return self
    }
}
