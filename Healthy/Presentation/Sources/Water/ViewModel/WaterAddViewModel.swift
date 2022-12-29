//
//  WaterAddViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/09.
//

import Foundation
import RxSwift
import RxCocoa
import Domain
import Util
import WidgetKit

private protocol WaterAddViewModelInput {
    func didPlus()
    func didMinus()
    func didAddWater(_ aCup: Float)
    func validateText(_ text: String)
}

private protocol WaterAddViewModelOutput {
    var waterCount: PublishRelay<String> { get }
    var isCountHidden: BehaviorRelay<Bool> { get }
    var isAddButtonActive: BehaviorRelay<Bool> { get }
    var validatedText: PublishRelay<String> { get }
}

public class WaterAddViewModel: WaterAddViewModelOutput {
    
    // 마신 물 카운트
    var count = 0
    var disposeBag = DisposeBag()
    
    // MARK: - Output
    public var waterCount: PublishRelay<String> = .init()
    public var isCountHidden: BehaviorRelay<Bool> = .init(value: true)
    public var isAddButtonActive: BehaviorRelay<Bool> = .init(value: false)
    public var validatedText: PublishRelay<String> = .init()
    
    // MARK: - Usecase
    private var validationUsecase: ValidationUseCaseProtocol!
    private var addWaterUsecase: AddWaterUsecaseProtocol!
    private var fetchWaterUsecase: FetchMonthWaterUsecaseProtocol!
    
    public init(validation: ValidationUseCaseProtocol,
                addWaterUsecase: AddWaterUsecaseProtocol,
                fetchWaterUsecase: FetchMonthWaterUsecaseProtocol) {
        self.validationUsecase = validation
        self.addWaterUsecase = addWaterUsecase
        self.fetchWaterUsecase = fetchWaterUsecase
    }
    
    deinit {
        print("WaterAddViewModel Deinit")
    }
}

// MARK: - Input
extension WaterAddViewModel: WaterAddViewModelInput {
    public func didPlus() {
        count += 1
        isCountHidden.accept(count == 0)
        isAddButtonActive.accept(count != 0)
        
        if count != 0 {
            if count > 0 {
                waterCount.accept("+\(count)")
            } else {
                waterCount.accept("\(count)")
            }
        }
    }
    
    public func didMinus() {
        count -= 1
        isCountHidden.accept(count == 0)
        isAddButtonActive.accept(count != 0)
        
        if count != 0 {
            if count > 0 {
                waterCount.accept("+\(count)")
            } else {
                waterCount.accept("\(count)")
            }
        }
    }
    
    // aCup은 ml -> l 단위로 변환해 줘야함
    public func didAddWater(_ aCup: Float) {
        // TODO: DB업데이트 필요
        let aCup = aCup / 1000 // 한컵
        let drink = aCup * Float(count) // 음수량
        let current = App.state.waterToday.value // 현재값
        
        if current + drink <= 0 {
            App.state.waterToday.accept(0)
        } else {
            App.state.waterToday.accept(current + drink)
        }
        
        let isAchieve: Bool = (App.state.waterToday.value / App.state.waterGoal.value) >= 1
        
        let model = Domain.DailyWaterModel(date: DateModel.today,
                                    goal: App.state.waterGoal.value,
                                    progress: App.state.waterToday.value,
                                    isAchieve: isAchieve)
        
        let _ = addWaterUsecase.excute(data: model)
            .subscribe(onSuccess: { [weak self] model in
                guard let self = self else { return }
                
                App.state.waterGoal.accept(model.goal)
                App.state.waterToday.accept(model.progress)
                
                WidgetCenter.shared.reloadTimelines(ofKind: "Water")
                
                self.fetchWaterUsecase.execute(year: DateModel.today.year, month: Month(rawValue: DateModel.today.month)!)
                    .subscribe{ models in
                        Log.d(models)
                        App.state.waterMontlyList.accept(models)
                    }
                    .disposed(by: self.disposeBag)
            })
            .disposed(by: disposeBag)
    }
    
    public func validateText(_ text: String) {
        validatedText.accept(validationUsecase.onlyDigit(text))
    }
}
