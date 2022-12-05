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
import Util

final class HomeDIContainer {
    
    init() {}
    
    // MARK: Usecases
    
    // MARK: ViewModel
    func makeHomeViewModel(action: HomeViewModelAction)-> HomeViewModel {
        let waterDI = WaterDIContainer()
        return HomeViewModel(action: action,
                             fetchTodayWaterUsecase: waterDI.makeFetchDailyWaterUsecase(),
                             fetchMonthWaterUsecase: waterDI.makeFetchMonthWaterUsecase())
    }
    // MARK: Coordinator
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigation: navigationController, dependencies: self)
    }
}

extension HomeDIContainer: HomeCoordinatorDependencies {
    func makeHomeViewController(action: HomeViewModelAction) -> Presentation.HomeViewController {
        return HomeViewController.create(viewModel: makeHomeViewModel(action: action))
    }
    
    func makeWaterCoordinator(navigation: UINavigationController) -> CoordinatorType {
        return WaterDIContainer().makeWaterCoordinator(navigation: navigation)
    }
    
    func makeStepsCoordinator(navigation: UINavigationController) -> CoordinatorType {
        return StepsDIContainer().makeStepsCoordinator(navigation: navigation)
    }
}

