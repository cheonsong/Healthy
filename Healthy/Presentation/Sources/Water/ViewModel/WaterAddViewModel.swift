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
    
    // MARK: - Output
    public var waterCount: PublishRelay<String> = .init()
    public var isCountHidden: BehaviorRelay<Bool> = .init(value: true)
    public var isAddButtonActive: BehaviorRelay<Bool> = .init(value: false)
    public var validatedText: PublishRelay<String> = .init()
    
    // MARK: - Usecase
    private var validationUsecase: ValidationUseCaseProtocol!
    private var addWaterUsecase: AddWaterUsecaseProtocol!
    
    public init(validation: ValidationUseCaseProtocol,
                addWaterUsecase: AddWaterUsecaseProtocol) {
        self.validationUsecase = validation
        self.addWaterUsecase = addWaterUsecase
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
        addWaterUsecase.excute(data: DailyWaterModel(date: DateModel.today,
                                                     goal: App.state.waterGoal.value,
                                                     progress: App.state.waterToday.value,
                                                     isAchieve: isAchieve))
    }
    
    public func validateText(_ text: String) {
        validatedText.accept(validationUsecase.onlyDigit(text))
    }
}
