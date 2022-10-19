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
    func makeHomeViewController() -> HomeViewController
}

public class HomeCoordinator: CoordinatorType {
    
    public var childCoordinators: [CoordinatorType] = []
    public var navigationController: UINavigationController
    private let dependencies: HomeCoordinatorDependencies
    
    
    public init(navigation: UINavigationController,
                dependencies: HomeCoordinatorDependencies) {
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        let homeVC = dependencies.makeHomeViewController()
        homeVC.coordinator = self
        
        self.navigationController.pushViewController(homeVC, animated: false)
    }
    
    deinit {
        print(#file)
    }
}

