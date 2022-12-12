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
    func makeMainCoordinator(navigationController: UINavigationController)-> MainCoordinator {
        return MainCoordinator(coordinator: navigationController, dependencies: self)
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
