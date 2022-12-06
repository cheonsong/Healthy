//
//  MyPageCoordinator.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation
import Util
import UIKit

public protocol MyPageCoordinatorDependencies {
    func makeMyPageViewController() -> MyPageViewController
}

public class MyPageCoordinator: CoordinatorType {
    public var childCoordinators: [CoordinatorType] = []
    
    public var navigationController: UINavigationController
    private let dependencies: MyPageCoordinatorDependencies
    
    public init(navigation: UINavigationController,
                dependencies: MyPageCoordinatorDependencies) {
        navigationController = navigation
        navigation.view.backgroundColor = .white
        self.dependencies = dependencies
    }
    
    public func start() {
        let vc = dependencies.makeMyPageViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
