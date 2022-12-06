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
    var fetchUserUsecase: FetchUserInfoUsecaseProtocol
    var action: WelcomeViewModelAction
    
    public init(action: WelcomeViewModelAction,
                fetchUserUsecase: FetchUserInfoUsecaseProtocol) {
        self.fetchUserUsecase = fetchUserUsecase
        self.action = action
    }
    
    public var userInfo: BehaviorRelay<UserModel?> = .init(value: nil)
    public var isMoveToMain: PublishRelay<Bool> = .init()
    
    public func viewDidLoad() {
        fetchUserUsecase.excute()
            .subscribe(onSuccess: { [weak self] models in
                Log.d(models)
                self?.userInfo.accept(models.first)
            })
            .disposed(by: disposeBag)
        
        userInfo
            .subscribe(onNext: { [weak self] model in
                guard let model = model else { return }
                App.state.userInfo.accept(model)
                self?.action.welcomeMoveToMain()
            })
            .disposed(by: disposeBag)
    }
    
    public func startButtonTapped() {
        guard let _ = self.userInfo.value else {
            action.moveToJoin()
            return
        }
        action.welcomeMoveToMain()
        
    }
}
