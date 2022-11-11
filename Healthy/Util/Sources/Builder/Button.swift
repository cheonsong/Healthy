//
//  Button.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class Button {
    open var view: UIButton
    
    public init(_ button: UIButton = UIButton()) {
        self.view = button
    }
    
    open func backgroundColor(_ color: UIColor)-> Button {
        view.backgroundColor = color
        return self
    }
    
    open func title(_ title: String)-> Button {
        view.setTitle(title, for: .normal)
        return self
    }
    
    open func titleColor(_ color: UIColor)-> Button {
        view.setTitleColor(color, for: .normal)
        return self
    }
    
    open func font(_ font: UIFont)-> Button {
        view.titleLabel?.font = font
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> Button {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> Button {
        view.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> Button {
        view.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    open func isSelected(_ isSelected: Bool)-> Button {
        view.isSelected = isSelected
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> Button {
        view.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> Button {
        view.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> Button {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> Button  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> Button {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> Button {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func image(_ image: UIImage)-> Button {
        view.setImage(image, for: .normal)
        return self
    }

    open func tintColor(_ tintColor: UIColor)-> Button {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> Button {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> Button {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> Button {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> Button {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> Button {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> Button {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> Button {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> Button {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> Button {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> Button {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> Button {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> Button {
        view.anchorPoint = anchorPoint
        return self
    }
    
}
