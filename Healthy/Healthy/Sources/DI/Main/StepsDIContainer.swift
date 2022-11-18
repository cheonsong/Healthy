//
//  StepsDIContainer.swift
//  App
//
//  Created by cheonsong on 2022/10/28.
//

import Foundation
import Presentation
import Domain
import Data
import UIKit
import Util

class StepsDIContainer {
    init() {}
    
    // MARK: Usecases
    
    // MARK: ViewModel
    
    // MARK: Coordinator
    func makeStepsCoordinator(navigation: UINavigationController)-> CoordinatorType {
        return StepsCoordinator(navigation: navigation, dependencies: self)
    }
}

extension StepsDIContainer: StepsCoordinatorDependencies {
    
    func makeStepsViewController() -> Presentation.StepsViewController {
        return StepsViewController.create()
    }
}
