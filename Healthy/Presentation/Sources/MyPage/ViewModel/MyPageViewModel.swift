//
//  MyPageViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/06.
//

import Foundation
import Util
import Domain
import RxSwift
import RxCocoa

public protocol MyPageViewModelAction {
    func moveToEditViewController()
}

protocol MyPageViewModelInpput {
    func editInfoTapped()
    func setAlarmTapped()
    func initDataTapped()
    func appVersionTapped()
}

protocol MyPageViewModelOutput {
    var dataInitComplete: PublishRelay<Void> { get }
}

public class MyPageViewModel: MyPageViewModelOutput {
    
    var disposeBag = DisposeBag()
    
    // MARK: Action & Usecase
    var action: MyPageViewModelAction
    var dataInitUsecase: InitUserInfoUsecaseProtocol
    
    // MARK: Output
    var dataInitComplete: PublishRelay<Void> = .init()
    
    public init(action: MyPageViewModelAction,
                dataInitUsecase: InitUserInfoUsecaseProtocol) {
        self.action = action
        self.dataInitUsecase = dataInitUsecase
    }
}

extension MyPageViewModel: MyPageViewModelInpput {
    func editInfoTapped() {
        action.moveToEditViewController()
    }
    
    func setAlarmTapped() {
        
    }
    
    func initDataTapped() {
        dataInitUsecase.excute()
            .subscribe(onSuccess: { [weak self] in
                self?.dataInitComplete.accept(())
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {_ in
                    exit(0)
                })
            })
            .disposed(by: disposeBag)
    }
    
    func appVersionTapped() {
        
    }
}
