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
    
    open func tintColor(_ tintColor: UIColor)-> StackView {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> StackView {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> StackView {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> StackView {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> StackView {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> StackView {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> StackView {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> StackView {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> StackView {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> StackView {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> StackView {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> StackView {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> StackView {
        view.anchorPoint = anchorPoint
        return self
    }
}
