//
//  ScrollView.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class ScrollViewBuilder {
    open var view = UIScrollView()
    
    public init (_ view: UIScrollView = UIScrollView()) {
        self.view = view
    }
    
    open func delegate(_ delegate: UIScrollViewDelegate?)-> ScrollViewBuilder {
        view.delegate = delegate
        return self
    }
    
    open func contentSize(_ contentSize: CGSize)-> ScrollViewBuilder {
        view.contentSize = contentSize
        return self
    }
    
    open func contentOffset(_ contentOffset: CGPoint)-> ScrollViewBuilder {
        view.contentOffset = contentOffset
        return self
    }
    
    open func contentInset(_ contentInset: UIEdgeInsets)-> ScrollViewBuilder {
        view.contentInset = contentInset
        return self
    }
    
    open func isScrollEnabled(_ isScrollEnabled: Bool)-> ScrollViewBuilder {
        view.isScrollEnabled = isScrollEnabled
        return self
    }
    
    open func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool)-> ScrollViewBuilder {
        view.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    open func isPagingEnabled(_ isPagingEnabled: Bool)-> ScrollViewBuilder {
        view.isPagingEnabled = isPagingEnabled
        return self
    }
    
    open func scrollsToTop(_ scrollsToTop: Bool)-> ScrollViewBuilder {
        view.scrollsToTop = scrollsToTop
        return self
    }
    
    open func bounces(_ bounces: Bool)-> ScrollViewBuilder {
        view.bounces = bounces
        return self
    }
    
    open func alwaysBounceVertical(_ alwaysBounceVertical: Bool)-> ScrollViewBuilder {
        view.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    open func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool)-> ScrollViewBuilder {
        view.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    open func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior)-> ScrollViewBuilder {
        view.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    open func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate)-> ScrollViewBuilder {
        view.decelerationRate = decelerationRate
        return self
    }
    
    open func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle)-> ScrollViewBuilder {
        view.indicatorStyle = indicatorStyle
        return self
    }
    
    open func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool)-> ScrollViewBuilder {
        view.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    open func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool)-> ScrollViewBuilder {
        view.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    open func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets)-> ScrollViewBuilder {
        view.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }
    
    open func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets)-> ScrollViewBuilder {
        view.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }
    
    open func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool)-> ScrollViewBuilder {
        view.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }
    
    open func refreshControl(_ refreshControl: UIRefreshControl?)-> ScrollViewBuilder {
        view.refreshControl = refreshControl
        return self
    }
    
    open func canCancelContentTouches(_ canCancelContentTouches: Bool)-> ScrollViewBuilder {
        view.canCancelContentTouches = canCancelContentTouches
        return self
    }
    
    open func delaysContentTouches(_ delaysContentTouches: Bool)-> ScrollViewBuilder {
        view.delaysContentTouches = delaysContentTouches
        return self
    }
    
    open func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode)-> ScrollViewBuilder {
        view.keyboardDismissMode = keyboardDismissMode
        return self
    }
    
    open func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode)-> ScrollViewBuilder {
        view.indexDisplayMode = indexDisplayMode
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> ScrollViewBuilder {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ScrollViewBuilder {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> ScrollViewBuilder {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ScrollViewBuilder {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> ScrollViewBuilder {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> ScrollViewBuilder {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ScrollViewBuilder {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ScrollViewBuilder {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ScrollViewBuilder  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> ScrollViewBuilder {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> ScrollViewBuilder {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> ScrollViewBuilder {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> ScrollViewBuilder {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> ScrollViewBuilder {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> ScrollViewBuilder {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> ScrollViewBuilder {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> ScrollViewBuilder {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> ScrollViewBuilder {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> ScrollViewBuilder {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> ScrollViewBuilder {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> ScrollViewBuilder {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> ScrollViewBuilder {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> ScrollViewBuilder {
        view.transform3D = transform3D
        return self
    }
}
