//
//  HomeCoordinator.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import UIKit
import Foundation
import Util

// 의존성 주입을 위한 Coordinator Dependency
public protocol HomeCoordinatorDependencies {
    func makeHomeViewController(action: HomeViewModelAction) -> HomeViewController
    func makeWaterCoordinator(navigation: UINavigationController)-> CoordinatorType
    func makeStepsCoordinator(navigation: UINavigationController)-> CoordinatorType
}

public class HomeCoordinator: NSObject, CoordinatorType {
    
    public var childCoordinators: [CoordinatorType] = []
    public var navigationController: UINavigationController!
    private var dependencies: HomeCoordinatorDependencies
    
    public init(navigation: UINavigationController,
                dependencies: HomeCoordinatorDependencies) {
        
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        let homeVC = dependencies.makeHomeViewController(action: self)
        homeVC.coordinator = self
        
        self.navigationController.pushViewController(homeVC, animated: false)
    }
    
    public func presentStepsViewController() {
        let coordinator = dependencies.makeStepsCoordinator(navigation: self.navigationController)
        coordinator.start()
    }
    
    deinit {
        print(#file)
    }
    
}

extension HomeCoordinator: HomeViewModelAction {
    public func moveToWaterViewController() {
        let coordinator = dependencies.makeWaterCoordinator(navigation: self.navigationController)
        coordinator.start()
    }
    
    public func showGuide() {
        let vc = GuideViewController()
        navigationController.present(vc, animated: true)
    }
}
