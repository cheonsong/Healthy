//
//  ScrollView.swift
//  Util
//
//  Created by cheonsong on 2022/10/27.
//

import Foundation
import UIKit

open class ScrollView {
    open var view = UIScrollView()
    
    public init (_ view: UIScrollView = UIScrollView()) {
        self.view = view
    }
    
    open func delegate(_ delegate: UIScrollViewDelegate?)-> ScrollView {
        view.delegate = delegate
        return self
    }
    
    open func contentSize(_ contentSize: CGSize)-> ScrollView {
        view.contentSize = contentSize
        return self
    }
    
    open func contentOffset(_ contentOffset: CGPoint)-> ScrollView {
        view.contentOffset = contentOffset
        return self
    }
    
    open func contentInset(_ contentInset: UIEdgeInsets)-> ScrollView {
        view.contentInset = contentInset
        return self
    }
    
    open func isScrollEnabled(_ isScrollEnabled: Bool)-> ScrollView {
        view.isScrollEnabled = isScrollEnabled
        return self
    }
    
    open func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool)-> ScrollView {
        view.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    open func isPagingEnabled(_ isPagingEnabled: Bool)-> ScrollView {
        view.isPagingEnabled = isPagingEnabled
        return self
    }
    
    open func scrollsToTop(_ scrollsToTop: Bool)-> ScrollView {
        view.scrollsToTop = scrollsToTop
        return self
    }
    
    open func bounces(_ bounces: Bool)-> ScrollView {
        view.bounces = bounces
        return self
    }
    
    open func alwaysBounceVertical(_ alwaysBounceVertical: Bool)-> ScrollView {
        view.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    open func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool)-> ScrollView {
        view.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    open func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior)-> ScrollView {
        view.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    open func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate)-> ScrollView {
        view.decelerationRate = decelerationRate
        return self
    }
    
    open func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle)-> ScrollView {
        view.indicatorStyle = indicatorStyle
        return self
    }
    
    open func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool)-> ScrollView {
        view.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    open func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool)-> ScrollView {
        view.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    open func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets)-> ScrollView {
        view.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }
    
    open func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets)-> ScrollView {
        view.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }
    
    open func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool)-> ScrollView {
        view.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }
    
    open func refreshControl(_ refreshControl: UIRefreshControl?)-> ScrollView {
        view.refreshControl = refreshControl
        return self
    }
    
    open func canCancelContentTouches(_ canCancelContentTouches: Bool)-> ScrollView {
        view.canCancelContentTouches = canCancelContentTouches
        return self
    }
    
    open func delaysContentTouches(_ delaysContentTouches: Bool)-> ScrollView {
        view.delaysContentTouches = delaysContentTouches
        return self
    }
    
    open func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode)-> ScrollView {
        view.keyboardDismissMode = keyboardDismissMode
        return self
    }
    
    open func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode)-> ScrollView {
        view.indexDisplayMode = indexDisplayMode
        return self
    }
    
    open func backgrouondColor(_ color: UIColor)-> ScrollView {
        view.backgroundColor = color
        return self
    }
    
    open func alpha(_ alpha: CGFloat)-> ScrollView {
        view.alpha = alpha
        return self
    }
    
    open func isOpaque(_ isOpaque: Bool)-> ScrollView {
        view.isOpaque = isOpaque
        return self
    }
    
    open func isHidden(_ isHidden: Bool)-> ScrollView {
        view.isHidden = isHidden
        return self
    }
    
    open func contentMode(_ contentMode: UIView.ContentMode)-> ScrollView {
        view.contentMode = contentMode
        return self
    }
    
    open func tag(_ tag: Int)-> ScrollView {
        view.tag = tag
        return self
    }
    
    open func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool)-> ScrollView {
        view.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    open func cornerRadius(_ cornerRadius: CGFloat)-> ScrollView {
        view.layer.cornerRadius = cornerRadius
        return self
    }
    
    open func masksToBounds(_ masksToBounds: Bool)-> ScrollView  {
        view.layer.masksToBounds = masksToBounds
        return self
    }
    
    open func borderWidth(_ borderWidth: CGFloat)-> ScrollView {
        view.layer.borderWidth = borderWidth
        return self
    }
    
    open func borderColor(_ borderColor: UIColor)-> ScrollView {
        view.layer.borderColor = borderColor.cgColor
        return self
    }
    
    open func tintColor(_ tintColor: UIColor)-> ScrollView {
        view.tintColor = tintColor
        return self
    }
    
    open func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode)-> ScrollView {
        view.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    open func clipsToBounds(_ clipsToBounds: Bool)-> ScrollView {
        view.clipsToBounds = clipsToBounds
        return self
    }
    
    open func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool)-> ScrollView {
        view.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    open func mask(_ mask: UIView?)-> ScrollView {
        view.mask = mask
        return self
    }
    
    open func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool)-> ScrollView {
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    
    open func isExclusiveTouch(_ isExclusiveTouch: Bool)-> ScrollView {
        view.isExclusiveTouch = isExclusiveTouch
        return self
    }
    
    open func frame(_ frame: CGRect)-> ScrollView {
        view.frame = frame
        return self
    }
    
    open func bounds(_ bounds: CGRect)-> ScrollView {
        view.bounds = bounds
        return self
    }
    
    open func center(_ center: CGPoint)-> ScrollView {
        view.center = center
        return self
    }
    
    open func transform(_ transform: CGAffineTransform)-> ScrollView {
        view.transform = transform
        return self
    }
    
    open func transform3D(_ transform3D: CATransform3D)-> ScrollView {
        view.transform3D = transform3D
        return self
    }
    
    @available(iOS 16.0, *)
    open func anchorPoint(_ anchorPoint: CGPoint)-> ScrollView {
        view.anchorPoint = anchorPoint
        return self
    }
}
