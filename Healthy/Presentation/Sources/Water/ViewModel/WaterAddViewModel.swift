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
    func didAddWater(_ aCup: Int)
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
    
    public init(validation: ValidationUseCaseProtocol) {
        self.validationUsecase = validation
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
    
    public func didAddWater(_ aCup: Int) {
        // TODO: DB업데이트 필요
        
    }
    
    public func validateText(_ text: String) {
        validatedText.accept(validationUsecase.onlyDigit(text))
    }
}
