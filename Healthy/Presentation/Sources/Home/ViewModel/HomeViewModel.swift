//
//  HomeViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/05.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

public protocol HomeViewModelAction {
    func moveToWaterViewController()
}

protocol HomeViewModelInput {
    func viewDidLoad()
    func viewWillAppear()
    func waterViewTapped()
}

protocol HomeViewModelOutput {
    
}

public class HomeViewModel: HomeViewModelOutput {
    
    var disposeBag = DisposeBag()
    var action: HomeViewModelAction
    var fetchTodayWaterUsecase: FetchTodayWaterUsecaseProtocol
    var fetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol
    
    public init(action: HomeViewModelAction,
                fetchTodayWaterUsecase: FetchTodayWaterUsecaseProtocol,
                fetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol) {
        self.action = action
        self.fetchTodayWaterUsecase = fetchTodayWaterUsecase
        self.fetchMonthWaterUsecase = fetchMonthWaterUsecase
    }
}

extension HomeViewModel: HomeViewModelInput {
    func viewDidLoad() {
        fetchTodayWaterUsecase.execute()
            .subscribe(onSuccess: { model in
                guard let model = model else {
                    App.state.waterToday.accept(0)
                    return
                }
                
                App.state.waterToday.accept(model.progress)
                App.state.waterGoal.accept(model.goal)
            })
            .disposed(by: disposeBag)
        
        fetchMonthWaterUsecase.execute(year: DateModel.today.year, month: Month(rawValue: DateModel.today.month)!)
            .subscribe(onSuccess: {
                App.state.waterMontlyList.accept($0)
            })
            .disposed(by: disposeBag)
    }
    
    func waterViewTapped() {
        action.moveToWaterViewController()
    }
    
    func viewWillAppear() {
        App.state.date.accept(DateModel.today)
    }
}
