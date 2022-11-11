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
    func makeWaterViewController(actions: WaterViewModelActions) -> WaterViewController
    func makeWaterAddModal()-> WaterAddModal
    func makeWaterSetModal()-> WaterSetModal
}

public class WaterCoordinator: NSObject {
    public var navigationController: UINavigationController
    private var dependencies: WaterCoordinatorDependencies
    
    private var viewController: WaterViewController!
    
    public init(navigation: UINavigationController,
                dependencies: WaterCoordinatorDependencies) {
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        viewController = dependencies.makeWaterViewController(actions: self)
        
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .overFullScreen
        self.navigationController.present(viewController, animated: true)
    }
    
    deinit {
        print(#file)
    }
}

extension WaterCoordinator: WaterViewModelActions {
    public func showWaterAddModal() {
        let modal = dependencies.makeWaterAddModal()
        modal.present(target: viewController.view)
    }
    
    public func showWaterSetModal() {
        let modal = dependencies.makeWaterSetModal()
        modal.present(target: viewController.view)
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
