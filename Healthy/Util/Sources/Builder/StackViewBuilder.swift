//
//  StackView.swift
//  Util
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import UIKit

open class StackViewBuilder {
    open var view: UIStackView = UIStackView()
    
    public init() {}
    
    open func axis(_ axis: NSLayoutConstraint.Axis)-> StackViewBuilder {
        view.axis = axis
        return self
    }
    
    open func distributon(_ distributon: UIStackView.Distribution)-> StackViewBuilder {
        view.distribution = distributon
        return self
    }
    
    open func alignment(_ alignment: UIStackView.Alignment)-> StackViewBuilder {
        view.alignment = alignment
        return self
    }
    
    open func spacing(_ spacing: CGFloat)-> StackViewBuilder {
        view.spacing = spacing
        return self
    }
    
    open func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool)-> StackViewBuilder {
        view.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }
    
    open func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool)-> StackViewBuilder {
        view.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }

    
    open func backgrouondColor(_ color: UIColor)-> StackViewBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> StackViewBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> StackViewBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> StackViewBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> StackViewBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> StackViewBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> StackViewBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> StackViewBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> StackViewBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> StackViewBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> StackViewBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> StackViewBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> StackViewBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> StackViewBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> StackViewBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> StackViewBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> StackViewBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> StackViewBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> StackViewBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> StackViewBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> StackViewBuilder {
        view.transform3D = transform3D
        return self
    }
}
