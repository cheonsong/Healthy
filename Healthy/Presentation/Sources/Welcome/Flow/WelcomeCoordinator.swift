//
//  WelcomeCoordinator.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/18.
//

import Foundation
import Util
import UIKit

public protocol WelcomCoordinatorDependencies {
    func makeWelcomeViewController(action: WelcomeViewModelAction)-> WelcomeViewContoller
    func makeMainCoordinator(navigaion: UINavigationController)-> MainCoordinator
    func makeJoinViewController(action: JoinViewModelAction)-> JoinViewController
}

public protocol WelcomeViewModelAction {
    func moveToJoin()
    func welcomeMoveToMain()
}

public class WelcomeCoordinator: NSObject, CoordinatorType {
    
    public var childCoordinators: [CoordinatorType] = []
    public var navigationController: UINavigationController
    var dependencies: WelcomCoordinatorDependencies
    private var transition: UIViewControllerAnimatedTransitioning?
    
    public init(navigationController: UINavigationController, dependencies: WelcomCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        super.init()
        self.navigationController.delegate = self
    }
    
    public func start() {
        let vc = dependencies.makeWelcomeViewController(action: self)
        transition = FadeAnimator(animationDuration: 0.5, isPresenting: true)
        navigationController.setViewControllers([vc], animated: true)
        transition = nil
    }
    
}

extension WelcomeCoordinator: WelcomeViewModelAction {
    public func moveToJoin() {
        let vc = dependencies.makeJoinViewController(action: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func welcomeMoveToMain() {
        dependencies.makeMainCoordinator(navigaion: self.navigationController).start()
    }
}

extension WelcomeCoordinator: JoinViewModelAction {
    public func joinMoveToMain() {
        let vc = dependencies.makeWelcomeViewController(action: self)
        navigationController.setViewControllers([vc], animated: true)
        dependencies.makeMainCoordinator(navigaion: self.navigationController).start()
    }
}

extension WelcomeCoordinator: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
}
