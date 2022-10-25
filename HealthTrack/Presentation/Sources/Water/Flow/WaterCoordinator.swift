//
//  WaterCoordinator.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/24.
//

import UIKit
import Util
import Domain

// 의존성 주입을 위한 Coordinator Dependency
public protocol WaterCoordinatorDependencies {
    func makeWaterViewController() -> WaterViewController
}

public class WaterCoordinator: NSObject {
    public var navigationController: UINavigationController
    private var dependencies: WaterCoordinatorDependencies
    
    
    public init(navigation: UINavigationController,
                dependencies: WaterCoordinatorDependencies) {
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        let vc = dependencies.makeWaterViewController()
        vc.coordinator = self
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController.present(vc, animated: true)
    }
    
    deinit {
        print(#file)
    }
}

extension WaterCoordinator: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        WaterTransition()
    }
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        WaterTransition()
    }
}
