//
//  MainDIContainer.swift
//  App
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation

import UIKit
import Foundation
import Presentation

final class MainDIContainer {
    
    public init() {}
    
    /// MainCoordinator 생성
    func makeMainCoordinator(tabBarController: CustomTabBarController)-> MainCoordinator {
        return MainCoordinator(coordinator: tabBarController, dependencies: self)
    }

}

extension MainDIContainer: MainCoordinatorDependencies {
    func makeMyPageCoordinator(navigationController: UINavigationController) -> Presentation.MyPageCoordinator {
        let di = MyPageDIContainer()
        return di.makeMyPageCoordinator(navigationController: navigationController)
    }
    
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        let di = HomeDIContainer()
        return di.makeHomeCoordinator(navigationController: navigationController)
    }
}
