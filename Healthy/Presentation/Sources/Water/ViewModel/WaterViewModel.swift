//
//  WaterViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/09.
//

import Foundation
import RxSwift
import RxCocoa

// Coordinator를 통해 화면이 전환되거나 새로운 뷰가 올라오는 경우
public protocol WaterViewModelActions {
    func showWaterAddModal()
    func showWaterSetModal()
}

protocol WaterViewModelInput {
    func didDrinkButtonTapped()
    func didSetButtonTapped()
}

protocol WaterViewModelOutput {
    
}

public class WaterViewModel: WaterViewModelOutput {
    
    var actions: WaterViewModelActions?
    
    public init(actions: WaterViewModelActions) {
        self.actions = actions
    }
}

extension WaterViewModel: WaterViewModelInput {
    func didDrinkButtonTapped() {
        self.actions?.showWaterAddModal()
    }
    
    func didSetButtonTapped() {
        self.actions?.showWaterSetModal()
    }
    
}
