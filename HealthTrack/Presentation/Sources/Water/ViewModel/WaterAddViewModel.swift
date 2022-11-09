//
//  WaterAddViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/09.
//

import Foundation
import RxSwift
import RxCocoa

private protocol WaterAddViewModelInput {
    func didPlus()
    func didMinus()
    func didAddWater()
}

private protocol WaterAddViewModelOutput {
    var waterCount: PublishRelay<String> { get }
    var isCountHidden: BehaviorRelay<Bool> { get }
    var isMinusButtonActive: BehaviorRelay<Bool> { get }
    var isAddButtonActive: BehaviorRelay<Bool> { get }
}

public class WaterAddViewModel: WaterAddViewModelOutput {
    
    // 마신 물 카운트
    var count = 0
    
    // MARK: - Output
    public var waterCount: PublishRelay<String> = .init()
    public var isCountHidden: BehaviorRelay<Bool> = .init(value: true)
    public var isAddButtonActive: BehaviorRelay<Bool> = .init(value: false)
    public var isMinusButtonActive: BehaviorRelay<Bool> = .init(value: false)
    
    public init() {}
    
    deinit {
        print("WaterAddViewModel Deinit")
    }
}

// MARK: - Input
extension WaterAddViewModel: WaterAddViewModelInput {
    public func didPlus() {
        count += 1
        waterCount.accept("x\(count)")
        
        if count == 1{
            isCountHidden.accept(false)
            isMinusButtonActive.accept(true)
            isAddButtonActive.accept(true)
        }
        print(count)
    }
    
    public func didMinus() {
        count -= 1
        if count == 0 {
            isCountHidden.accept(true)
            isMinusButtonActive.accept(false)
            isAddButtonActive.accept(false)
        } else {
            waterCount.accept("x\(count)")
        }
        print(count)
    }
    
    public func didAddWater() {
        // TODO: DB업데이트 필요
        
    }
}
