//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

open class View {
    open var view = UIView()
    
    public init (_ view: UIView = UIView()) {
        self.view = view
    }
    
    open func backgrouondColor(_ color: UIColor)-> View {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> View {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> View {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> View {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> View {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> View {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> View {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> View {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> View  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
}
