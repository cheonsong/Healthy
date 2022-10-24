//
//  WaterDIContainer.swift
//  App
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import Presentation
import Domain
import Data
import UIKit

class WaterDIContainer {
    init() {}
    
    // MARK: Usecases
    
    // MARK: ViewModel
    
    // MARK: Coordinator
    func makeWaterCoordinator(navigation: UINavigationController)-> WaterCoordinator {
        return WaterCoordinator(navigation: navigation, dependencies: self)
    }
}

extension WaterDIContainer: WaterCoordinatorDependencies {
    func makeWaterViewController() -> Presentation.WaterViewController {
        return WaterViewController.create()
    }
}
