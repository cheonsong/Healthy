//
//  StepsTransition.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/28.
//

import Foundation
import SnapKit
import UIKit
import Util
import DesignSystem

private enum Constants {
    static let duration = 0.5
}

final class StepsTransition: NSObject {
    
}

extension StepsTransition: UIViewControllerAnimatedTransitioning {
    // 애니메이션 동작 시간
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.duration
    }
    
    // 애니메이션 정의
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        presentAnimation(using: transitionContext)
        dismissAnimation(using: transitionContext)
    }
    
    func presentAnimation(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. 애니메이션에 적용할 뷰 획득
        let containerView = transitionContext.containerView
        guard let toVC = transitionContext.viewController(forKey: .to) as? StepsViewController,
              let tabbar = transitionContext.viewController(forKey: .from) as? CustomTabBarController,
              let navi = tabbar.selectedViewController as? UINavigationController,
              let fromVC = navi.topViewController as? HomeViewController else {
            return
        }
        
        let toView = toVC.view!
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(toView)
        
        let frame = CGRect(x: Const.padding, y: fromVC.welcomeLabel.frame.maxY + 10 + fromVC.stepView.frame.minY - fromVC.scrollView.contentOffset.y, width: Const.fullWidth, height: Const.mainViewHeight)
        toView.frame = frame
        toView.backgroundColor = .r2
        toView.layer.cornerRadius = 10
        
        let views = [toVC.mainLabel, toVC.navigation, toVC.calendar, toVC.circleView, toVC.countLabel, toVC.consumedLabel]
        views.forEach {
            $0.transform = CGAffineTransform(translationX: -200, y: -350).scaledBy(x: 0.1, y: 0.1)
            $0.alpha = 0
        }
        
        // 3. 커스텀 애니메이션 정의
        UIView.animateKeyframes(
            withDuration: Constants.duration,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 1,
                    animations: {
                        toView.layer.cornerRadius = 0
                        toView.backgroundColor = .white
                        toView.frame = fromVC.view.frame
                        views.forEach {
                            $0.transform = .identity
                            $0.alpha = 1
                        }
                    }
                )
            },
            completion: { transitionContext.completeTransition($0) }
        )
    }
    
    func dismissAnimation(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. 애니메이션에 적용할 뷰 획득
        let containerView = transitionContext.containerView
        guard let fromVC = transitionContext.viewController(forKey: .from) as? StepsViewController,
              let tabbar = transitionContext.viewController(forKey: .to) as? CustomTabBarController,
              let navi = tabbar.selectedViewController as? UINavigationController,
              let toVC = navi.topViewController as? HomeViewController else {
            return
        }
        
        let fromView = fromVC.view!
        
        containerView.addSubview(fromView)
        containerView.bringSubviewToFront(fromView)
    
        
        // 3. 커스텀 애니메이션 정의
        UIView.animateKeyframes(
            withDuration: Constants.duration,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 1,
                    animations: {
                        fromView.backgroundColor = .r2
                        fromView.roundCorners(.allCorners, radius: 10)
                        fromView.subviews.forEach { $0.removeFromSuperview() }
                        let frame = CGRect(x: Const.padding, y: toVC.welcomeLabel.frame.maxY + 10 + toVC.stepView.frame.minY - toVC.scrollView.contentOffset.y, width: Const.fullWidth, height: Const.mainViewHeight)
                        fromView.frame = frame
                    }
                )
            },
            completion: { transitionContext.completeTransition($0) }
        )
    }
}
