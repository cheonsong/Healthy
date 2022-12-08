//
//  EditViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/08.
//

import Foundation
import Domain
import Util
import RxSwift
import RxCocoa

protocol EditViewModelInput {
    func ageTextInput(text: String)
    func heightTextInput(text: String)
    func weightTextInput(text: String)
    func saveButtonTapped(model: UserModel)
}

protocol EditViewModelOutput {
    var isSaveSuccess: PublishRelay<Bool> { get }
    var validatedAgeText: PublishRelay<String> { get }
    var validatedHeightText: PublishRelay<String> { get }
    var validatedWeightText: PublishRelay<String> { get }
}

public class EditViewModel: EditViewModelOutput {
    
    var disposeBag = DisposeBag()
    
    // MARK: Usecase
    var validateUsecase: ValidationUseCaseProtocol
    var updateUserInfoUsecase: UpdateUserInfoUsecaseProtocol
    
    // MARK: Output
    var isSaveSuccess: PublishRelay<Bool> = .init()
    var validatedAgeText: PublishRelay<String> = .init()
    var validatedHeightText: PublishRelay<String> = .init()
    var validatedWeightText: PublishRelay<String> = .init()
    
    public init(validateUsecase: ValidationUseCaseProtocol,
                updateUserInfoUsecase: UpdateUserInfoUsecaseProtocol) {
        self.validateUsecase = validateUsecase
        self.updateUserInfoUsecase = updateUserInfoUsecase
    }
    
}

extension EditViewModel: EditViewModelInput {
    func ageTextInput(text: String) {
        let text = validateUsecase.onlyDigit(text)
        validatedAgeText.accept(text)
    }
    
    func heightTextInput(text: String) {
        let text = validateUsecase.onlyDigit(text)
        validatedHeightText.accept(text)
    }
    
    func weightTextInput(text: String) {
        let text = validateUsecase.onlyDigit(text)
        validatedWeightText.accept(text)
    }
    
    func saveButtonTapped(model: UserModel) {
        updateUserInfoUsecase.excute(model: model)
            .subscribe(onSuccess: { [weak self] user in
                App.state.userInfo.accept(user)
                self?.isSaveSuccess.accept(true)
            }, onFailure: { [weak self] _ in
                self?.isSaveSuccess.accept(false)
            })
            .disposed(by: disposeBag)
    }
}
