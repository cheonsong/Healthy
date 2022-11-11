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
    
    open func borderWidth(_ borderWidth: CGFloat)-> View {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> View {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> View {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> View {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> View {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> View {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> View {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> View {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> View {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> View {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> View {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> View {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> View {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> View {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> View {
        view.anchorPoint = anchorPoint
        return self
    }
}
