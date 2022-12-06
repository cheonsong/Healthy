//
//  UIView+Extension.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture

extension UIView {
    
    /// roundCorners
    /// - Parameters:
    ///   - corners: 라운드 코너 [.topLeft, .topRight]
    ///   - radius: 8.0
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    public var tapGesture: Observable<UITapGestureRecognizer> {
        get {
            return self.tapGesture(1)
        }
    }
    
    public func tapGesture(_ throttle: Int = 1, _ state: UIGestureRecognizer.State = .recognized, useThrottle: Bool = true ) -> Observable<UITapGestureRecognizer> {
        return useThrottle ?
        self.rx.tapGesture().when(state).throttle(.seconds(throttle), latest: false, scheduler: MainScheduler.instance) :
        self.rx.tapGesture().when(state)
        
    }
}
