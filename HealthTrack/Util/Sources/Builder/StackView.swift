//
//  StackView.swift
//  Util
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import UIKit

open class StackView {
    open var view: UIStackView = UIStackView()
    
    public init() {}
    
    open func axis(_ axis: NSLayoutConstraint.Axis)-> StackView {
        view.axis = axis
        return self
    }
    
    open func distributon(_ distributon: UIStackView.Distribution)-> StackView {
        view.distribution = distributon
        return self
    }
    
    open func alignment(_ alignment: UIStackView.Alignment)-> StackView {
        view.alignment = alignment
        return self
    }
    
    open func spacing(_ spacing: CGFloat)-> StackView {
        view.spacing = spacing
        return self
    }
    
    open func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool)-> StackView {
        view.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }
    
    open func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool)-> StackView {
        view.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }

    
    open func backgrouondColor(_ color: UIColor)-> StackView {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> StackView {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> StackView {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> StackView {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> StackView {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> StackView {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> StackView {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> StackView {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> StackView  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
}
