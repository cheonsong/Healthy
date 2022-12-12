//
//  Button.swift
//  Util
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

open class ButtonBuilder {
    open var view: UIButton
    
    public init(_ button: UIButton = UIButton()) {
        self.view = button
    }
    
    open func backgroundColor(_ color: UIColor)-> ButtonBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func title(_ title: String)-> ButtonBuilder {
        view.setTitle(title, for: .normal)
        return self
    }
    
    open func titleColor(_ color: UIColor)-> ButtonBuilder {
        view.setTitleColor(color, for: .normal)
        return self
    }
    
    open func font(_ font: UIFont)-> ButtonBuilder {
        view.titleLabel?.font = font
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ButtonBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func textAlignment(_ textAlignment: NSTextAlignment)-> ButtonBuilder {
        view.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    open func numberOfLines(_ numberOfLines: Int)-> ButtonBuilder {
        view.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    open func isSelected(_ isSelected: Bool)-> ButtonBuilder {
        view.isSelected = isSelected
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ButtonBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ButtonBuilder {
        view.alpha = alpha
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ButtonBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ButtonBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> ButtonBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> ButtonBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func image(_ image: UIImage)-> ButtonBuilder {
        view.setImage(image, for: .normal)
        return self
    }

    open func tintColor(_ tintColor: UIColor)-> ButtonBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> ButtonBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> ButtonBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> ButtonBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> ButtonBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> ButtonBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> ButtonBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> ButtonBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> ButtonBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> ButtonBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> ButtonBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> ButtonBuilder {
        view.transform3D = transform3D
        return self
    }
    
}
