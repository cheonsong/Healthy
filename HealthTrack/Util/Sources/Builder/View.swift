//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

public class View {
    public var view = UIView()
    
    public func backgrouondColor(_ color: UIColor)-> View {
        view.backgroundColor = color
        return self
    }
    
    public func alpha(_ alpha: CGFloat)-> View {
        view.alpha = alpha
        return self
    }
    
    public func isOpaque(_ isOpaque: Bool)-> View {
        view.isOpaque = isOpaque
        return self
    }
    
    public func isHidden(_ isHidden: Bool)-> View {
        view.isHidden = isHidden
        return self
    }
    
    public func contentMode(_ contentMode: UIView.ContentMode)-> View {
        view.contentMode = contentMode
        return self
    }
    
    public func tag(_ tag: Int)-> View {
        view.tag = tag
        return self
    }
    
    public func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> View {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    public func cornerRadius(_ cornerRadius: CGFloat)-> View {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    public func masksToBounds(_ masksToBounds: Bool)-> View  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
}
