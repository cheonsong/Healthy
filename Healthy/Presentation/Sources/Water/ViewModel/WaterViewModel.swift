//
//  WaterViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/09.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

// Coordinator를 통해 화면이 전환되거나 새로운 뷰가 올라오는 경우
public protocol WaterViewModelActions {
    func showWaterAddModal()
    func showWaterSetModal()
}

protocol WaterViewModelInput {
    func didDrinkButtonTapped()
    func didSetButtonTapped()
    func viewDidLoad()
}

protocol WaterViewModelOutput {
    var todayWater: BehaviorRelay<Domain.DailyWaterModel?> { get }
    var monthWater: BehaviorRelay<[Domain.DailyWaterModel]> { get }
}

public class WaterViewModel: WaterViewModelOutput {
    
    var disposeBag = DisposeBag()
    
    // MARK: - Actions & Usecases
    var actions: WaterViewModelActions?
    var fetchDailyWaterUsecase: FetchTodayWaterUsecaseProtocol
    var fetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol
    
    public init(actions: WaterViewModelActions,
                fetchDailyWaterUsecase: FetchTodayWaterUsecaseProtocol,
                fetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol) {
        self.actions = actions
        self.fetchDailyWaterUsecase = fetchDailyWaterUsecase
        self.fetchMonthWaterUsecase = fetchMonthWaterUsecase
    }
    
    // MARK: - OUTPUT
    var todayWater = BehaviorRelay<Domain.DailyWaterModel?>(value: nil)
    var monthWater = BehaviorRelay<[Domain.DailyWaterModel]>(value: [])
}

extension WaterViewModel: WaterViewModelInput {
    func didDrinkButtonTapped() {
        self.actions?.showWaterAddModal()
    }
    
    func didSetButtonTapped() {
        self.actions?.showWaterSetModal()
    }
    
    func viewDidLoad() {
        let year = DateModel.today.year
        let month: Month = Month(rawValue: DateModel.today.month)!
        
        fetchMonthWaterUsecase.execute(year: year, month: month)
            .subscribe(onSuccess: { [weak self] models in
                App.state.waterMontlyList.accept(models)
            })
            .disposed(by: disposeBag)
    }
    
}
