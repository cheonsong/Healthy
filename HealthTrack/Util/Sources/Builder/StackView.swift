//
//  StackView.swift
//  Util
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import UIKit

open class StackView {
    open var stackView: UIStackView = UIStackView()
    
    public init() {}
    
    open func axis(_ axis: NSLayoutConstraint.Axis)-> StackView {
        stackView.axis = axis
        return self
    }
    
    open func distributon(_ distributon: UIStackView.Distribution)-> StackView {
        stackView.distribution = distributon
        return self
    }
    
    open func alignment(_ alignment: UIStackView.Alignment)-> StackView {
        stackView.alignment = alignment
        return self
    }
    
    open func spacing(_ spacing: CGFloat)-> StackView {
        stackView.spacing = spacing
        return self
    }
    
    open func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool)-> StackView {
        stackView.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }
    
    open func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool)-> StackView {
        stackView.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }

    
    open func backgrouondColor(_ color: UIColor)-> StackView {
        stackView.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> StackView {
        stackView.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> StackView {
        stackView.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> StackView {
        stackView.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> StackView {
        stackView.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> StackView {
        stackView.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> StackView {
        stackView.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> StackView {
        stackView.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> StackView  {
        stackView.layer.masksToBounds = masksToBounds
        return self
    }
}
