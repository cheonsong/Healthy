//
//  HomeDIContainer.swift
//  App
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import Domain
import Data
import Presentation
import UIKit

final class HomeDIContainer {
    
    init() {}
    
    // MARK: Usecases
    
    // MARK: ViewModel
    
    // MARK: Coordinator
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigation: navigationController, dependencies: self)
    }
}

extension HomeDIContainer: HomeCoordinatorDependencies {
    func makeHomeViewController() -> Presentation.HomeViewController {
        return HomeViewController.create()
    }
    
    func makeWaterCoordinator(navigation: UINavigationController) -> WaterCoordinator {
        return WaterDIContainer().makeWaterCoordinator(navigation: navigation)
    }
}

