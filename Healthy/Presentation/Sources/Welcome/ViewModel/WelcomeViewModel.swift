//
//  WelcomeViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation
import Domain
import Util
import RxSwift
import RxCocoa

public protocol WelcomeViewModelInput {
    func viewDidLoad()
    func startButtonTapped()
}

public protocol WelcomeViewModelOutput {
    var userInfo: BehaviorRelay<UserModel?> { get }
    var isMoveToMain: PublishRelay<Bool> { get }
}

public class WelcomeViewModel: WelcomeViewModelInput, WelcomeViewModelOutput {
    
    var disposeBag = DisposeBag()
    var usecase: FetchUserInfoUsecaseProtocol
    var action: WelcomeViewModelAction
    
    public init(action: WelcomeViewModelAction,
                usecase: FetchUserInfoUsecaseProtocol) {
        self.usecase = usecase
        self.action = action
    }
    
    public var userInfo: BehaviorRelay<UserModel?> = .init(value: nil)
    public var isMoveToMain: PublishRelay<Bool> = .init()
    
    public func viewDidLoad() {
        usecase.excute()
            .subscribe(onSuccess: { [weak self] models in
                Log.d(models)
                self?.userInfo.accept(models.first)
            })
            .disposed(by: disposeBag)
        
        userInfo
            .subscribe(onNext: { model in
                guard let model = model else { return }
                App.state.name.accept(model.name)
                App.state.age.accept(model.age)
                App.state.gender.accept(model.gender)
                App.state.waterGoal.accept(model.water?.goal ?? 2)
            })
            .disposed(by: disposeBag)
    }
    
    public func startButtonTapped() {
        guard let info = self.userInfo.value else {
            action.moveToJoin()
            return
        }
        Log.d(info)
        action.welcomeMoveToMain()
        
    }
}
