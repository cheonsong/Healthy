//
//  View.swift
//  Util
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

open class ViewBuilder {
    open var view = UIView()
    
    public init (_ view: UIView = UIView()) {
        self.view = view
    }
    
    open func backgrouondColor(_ color: UIColor)-> ViewBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ViewBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> ViewBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ViewBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> ViewBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> ViewBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ViewBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ViewBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ViewBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> ViewBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> ViewBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> ViewBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> ViewBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> ViewBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> ViewBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> ViewBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> ViewBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> ViewBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> ViewBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> ViewBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> ViewBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> ViewBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> ViewBuilder {
        view.transform3D = transform3D
        return self
    }
}
