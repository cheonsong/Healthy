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
}

public class WelcomeCoordinator: CoordinatorType {
    
    public var childCoordinators: [CoordinatorType] = []
    public var navigationController: UINavigationController
    var dependencies: WelcomCoordinatorDependencies
    
    
    public init(navigationController: UINavigationController, dependencies: WelcomCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        let vc = dependencies.makeWelcomeViewController(action: self)
        navigationController.setViewControllers([vc], animated: false)
    }
    
}

extension WelcomeCoordinator: WelcomeViewModelAction {
    public func moveToJoin() {
        let vc = dependencies.makeJoinViewController(action: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension WelcomeCoordinator: JoinViewModelAction {
    public func moveToMain() {
        dependencies.makeMainCoordinator(navigaion: self.navigationController).start()
    }
}