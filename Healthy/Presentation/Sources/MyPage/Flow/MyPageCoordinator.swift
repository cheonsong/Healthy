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
    func makeMyPageViewController(action: MyPageViewModelAction) -> MyPageViewController
    func makeEditViewController()-> EditViewController
    func makeCSViewController()-> CSViewController
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
        let vc = dependencies.makeMyPageViewController(action: self)
        navigationController.pushViewController(vc, animated: false)
    }
}

extension MyPageCoordinator: MyPageViewModelAction {
    public func moveToEditViewController() {
        let vc = dependencies.makeEditViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func moveToCustomerService() {
        let vc = dependencies.makeCSViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
