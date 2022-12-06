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
    func makeValidationUsecase()-> ValidationUseCaseProtocol {
        return ValidationUseCase()
    }
    
    func makeAddWaterUsecase()-> AddWaterUsecaseProtocol {
        return AddWaterUsecase(repository: DailyWaterRepository())
    }
    
    func makeFetchDailyWaterUsecase()-> FetchTodayWaterUsecaseProtocol {
        return FetchTodayWaterUsecase(repository: DailyWaterRepository())
    }
    
    func makeFetchMonthWaterUsecase()-> FetchMonthWaterUsecaseProtocol {
        return FetchMonthWaterUsecase(repository: DailyWaterRepository())
    }
    
    func makeUpdateUserInfoUsecase()-> UpdateUserInfoUsecaseProtocol {
        return UpdateUserInfoUsecase(repository: UserRepository())
    }
    
    // MARK: ViewModel
    func makeWaterViewModel(actions: WaterViewModelActions)-> WaterViewModel {
        return WaterViewModel(actions: actions,
                              fetchDailyWaterUsecase: makeFetchDailyWaterUsecase(),
                              fetchMonthWaterUsecase: makeFetchMonthWaterUsecase())
    }
    
    func makeWaterAddViewModel()-> WaterAddViewModel {
        return WaterAddViewModel(validation: makeValidationUsecase(),
                                 addWaterUsecase: makeAddWaterUsecase(),
                                 fetchWaterUsecase: makeFetchMonthWaterUsecase())
    }
    
    func makeWaterSetViewModel()-> WaterSetViewModel {
        return WaterSetViewModel(updateUserInfoUsecase: makeUpdateUserInfoUsecase(),
                                 validationUsecase: makeValidationUsecase(),
                                 addDailyWaterUsecase: makeAddWaterUsecase())
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
        return WaterSetModal(viewModel: makeWaterSetViewModel())
    }
}
