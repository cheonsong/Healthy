//
//  MyPresentTransition.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import SnapKit
import UIKit
import Util

private enum Constants {
    static let duration = 0.5
}

final class WaterTransition: NSObject {
    
}

extension WaterTransition: UIViewControllerAnimatedTransitioning {
    // 애니메이션 동작 시간
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.duration
    }
    
    // 애니메이션 정의
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. 애니메이션에 적용할 뷰 획득
        let containerView = transitionContext.containerView
        guard let toVC = transitionContext.viewController(forKey: .to) as? WaterViewController,
              let tabbar = transitionContext.viewController(forKey: .from) as? CustomTabBarController,
              let navi = tabbar.selectedViewController as? UINavigationController,
              let fromVC = navi.topViewController as? HomeViewController else {
            return
        }
        
        let toView = toVC.view!
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(toView)
        
        toView.frame = fromVC.waterView.frame
        toView.backgroundColor = .b2
        toView.layer.cornerRadius = 10
        
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
                    }
                )
            },
            completion: { transitionContext.completeTransition($0) }
        )
    }
}
