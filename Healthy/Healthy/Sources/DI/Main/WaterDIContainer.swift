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
import Util

class WaterDIContainer {
    init() {}
    
    // MARK: Usecases
    func makeValidationUsecase()-> ValidationUseCase {
        return ValidationUseCase()
    }
    
    // MARK: ViewModel
    func makeWaterViewModel(actions: WaterViewModelActions)-> WaterViewModel {
        return WaterViewModel(actions: actions)
    }
    
    func makeWaterAddViewModel()-> WaterAddViewModel {
        return WaterAddViewModel(validation: makeValidationUsecase())
    }
    
    // MARK: Coordinator
    func makeWaterCoordinator(navigation: UINavigationController)-> CoordinatorType {
        return WaterCoordinator(navigation: navigation, dependencies: self)
    }
}

extension WaterDIContainer: WaterCoordinatorDependencies {
    
    func makeWaterViewController(actions: WaterViewModelActions) -> Presentation.WaterViewController {
        return WaterViewController.create(with: makeWaterViewModel(actions: actions))
    }
    
    func makeWaterAddModal() -> WaterAddModal {
        return WaterAddModal(viewModel: makeWaterAddViewModel())
    }
    
    func makeWaterSetModal() -> WaterSetModal {
        return WaterSetModal()
    }
}
