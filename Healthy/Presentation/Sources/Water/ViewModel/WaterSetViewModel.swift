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

private protocol WaterSetViewModelInput {
    func goalTextFormInput(text: String)
    func completeButtonTapped()
}

private protocol WaterSetViewModelOutput {
    var validatedText: BehaviorRelay<String> { get }
    var isCompleteButtonActive: BehaviorRelay<Bool> { get }
}

public class WaterSetViewModel: WaterSetViewModelOutput {
    
    var disposeBag = DisposeBag()
    var goal: Float = 0
    
    // MARK: - Usecase
    var updateUserInfoUsecase: UpdateUserInfoUsecaseProtocol
    var validationUsecase: ValidationUseCaseProtocol
    var addDailyWaterUsecase: AddWaterUsecaseProtocol
    
    // MARK: - Output
    var validatedText: BehaviorRelay<String> = .init(value: "")
    var isCompleteButtonActive: BehaviorRelay<Bool> = .init(value: false)
    
    public init(updateUserInfoUsecase: UpdateUserInfoUsecaseProtocol,
                validationUsecase: ValidationUseCaseProtocol,
                addDailyWaterUsecase: AddWaterUsecaseProtocol) {
        self.updateUserInfoUsecase = updateUserInfoUsecase
        self.validationUsecase = validationUsecase
        self.addDailyWaterUsecase = addDailyWaterUsecase
    }
    
    deinit {
        print("WaterSetViewModel Deinit")
    }
}

// MARK: - Input
extension WaterSetViewModel: WaterSetViewModelInput {
    public func goalTextFormInput(text: String) {
        let text = validationUsecase.onlyDigit(text)
        goal = Float(text) ?? 0
        validatedText.accept(text)
        isCompleteButtonActive.accept(!text.isEmpty)
    }
    
    public func completeButtonTapped() {
        guard var model = App.state.userInfo.value else { return }
        model.water?.goal = self.goal / 1000
        
        updateUserInfoUsecase.excute(model: model)
            .subscribe(onSuccess: { [weak self] userInfo in
                guard let self = self,
                      let water = userInfo.water else { return }
                
                App.state.userInfo.accept(userInfo)
                
                let isAchieve: Bool = (App.state.waterToday.value / (water.goal)) >= 1
                
                let dailyModel = Domain.DailyWaterModel(date: DateModel.today,
                                            goal: water.goal,
                                            progress: App.state.waterToday.value,
                                            isAchieve: isAchieve)
                
                self.addDailyWaterUsecase.excute(data: dailyModel)
                    .subscribe(onSuccess: { model in
                        
                        App.state.waterGoal.accept(model.goal)
                        App.state.waterToday.accept(model.progress)
                    })
                    .disposed(by: self.disposeBag)
                
            })
            .disposed(by: disposeBag)
    }
}
