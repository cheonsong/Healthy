//
//  StepsCoordinator.swift
//  PresentationTests
//
//  Created by cheonsong on 2022/10/28.
//

import Foundation
import UIKit
import Util
import Domain

// 의존성 주입을 위한 Coordinator Dependency
public protocol StepsCoordinatorDependencies: CoordinatorType {
    func makeStepsViewController() -> StepsViewController
}

public class StepsCoordinator: NSObject {
    
    public var navigationController: UINavigationController
    private var dependencies: StepsCoordinatorDependencies
    
    
    public init(navigation: UINavigationController,
                dependencies: StepsCoordinatorDependencies) {
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        let vc = dependencies.makeStepsViewController()
        vc.coordinator = self
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController.present(vc, animated: true)
    }
    
    deinit {
        print(#file)
    }
}

extension StepsCoordinator: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        StepsTransition()
        return nil
    }
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        StepsTransition()
        return nil
    }
}
