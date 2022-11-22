//
//  JoinViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/21.
//

import Foundation
import Util
import Domain
import RxSwift
import RxCocoa
import DesignSystem

public protocol JoinViewModelAction {
    func moveToMain()
}

public protocol JoinViewModelInput {
    func completeButtonTapped(model: UserModel)
    func nameTextInput(_ text: String)
    func genderButtonTapped(_ type: TwiceButtonCase)
    func ageTextInput(_ text: String)
    func heightButtonTapped(_ type: TwiceButtonCase)
    func heightTextInput(_ text: String)
    func weightButtonTapped(_ type: TwiceButtonCase)
    func weightTextInput(_ text: String)
}

public protocol JoinViewModelOutput {
    var nameNextButtonIsActive: BehaviorRelay<Bool> { get }
    var nameValidatedText: BehaviorRelay<String> { get }
    var genderNextButtonIsActive: BehaviorRelay<Bool> { get }
    var ageNextButtonIsActive: BehaviorRelay<Bool> { get }
    var ageValidatedText: BehaviorRelay<String> { get }
    var heightNextButtonIsActive: BehaviorRelay<Bool> { get }
    var heightValidatedText: BehaviorRelay<String> { get }
    var weightNextButtonIsActive: BehaviorRelay<Bool> { get }
    var weightValidatedText: BehaviorRelay<String> { get }
}

public class JoinViewModel: JoinViewModelOutput {
    
    private var disposeBag = DisposeBag()
    private var validateUsecase: ValidationUseCaseProtocol
    private var action:JoinViewModelAction
    
    public init(validate: ValidationUseCaseProtocol,
                action: JoinViewModelAction) {
        self.validateUsecase = validate
        self.action = action
        
        bind()
    }
    
    // MARK: OUTPUT
    // NAME
    public var nameNextButtonIsActive: BehaviorRelay<Bool>    = .init(value: false)
    public var nameValidatedText: BehaviorRelay<String>       = .init(value: "")
    // GENDER
    public var genderNextButtonIsActive: BehaviorRelay<Bool>  = .init(value: false)
    // AGE
    public var ageNextButtonIsActive: BehaviorRelay<Bool>     = .init(value: false)
    public var ageValidatedText: BehaviorRelay<String>        = .init(value: "")
    // HEIGHT
    private var heightButtonIsTapped: BehaviorRelay<Bool> = .init(value: false)
    public var heightValidatedText: BehaviorRelay<String>     = .init(value: "")
    // WEIGHT
    private var weightButtonIsTapped: BehaviorRelay<Bool> = .init(value: false)
    public var weightValidatedText: BehaviorRelay<String>     = .init(value: "")
    
    public var heightNextButtonIsActive: BehaviorRelay<Bool> = .init(value: false)
    public var weightNextButtonIsActive: BehaviorRelay<Bool>  = .init(value: false)
    
    func bind() {
        Observable.combineLatest(heightValidatedText, heightButtonIsTapped)
            .subscribe(onNext: { [weak self] text, tapped in
                self?.heightNextButtonIsActive.accept(!text.isEmpty && tapped)
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(weightValidatedText, weightButtonIsTapped)
            .subscribe(onNext: { [weak self] text, tapped in
                self?.weightNextButtonIsActive.accept(!text.isEmpty && tapped)
            })
            .disposed(by: disposeBag)
    }
}

extension JoinViewModel: JoinViewModelInput {
    
    /// 모든 정보 작성 후 확인 버튼 터치시
    public func completeButtonTapped(model: UserModel) {
        action.moveToMain()
    }
    
    /// 이름 정보 입력 시
    public func nameTextInput(_ text: String) {
        nameValidatedText.accept(validateUsecase.nameValidation(text))
        nameNextButtonIsActive.accept(!text.isEmpty)
    }
    
    /// 나이 정보 입력시
    public func ageTextInput(_ text: String) {
        ageValidatedText.accept(validateUsecase.onlyDigit(text))
        ageNextButtonIsActive.accept(!text.isEmpty)
    }
    
    /// 성별 선택 시
    public func genderButtonTapped(_ type: TwiceButtonCase) {
        genderNextButtonIsActive.accept(type != .none)
    }
    
    /// 키 단위 선택 시
    public func heightButtonTapped(_ type: TwiceButtonCase) {
        heightButtonIsTapped.accept(type != .none)
    }
    
    /// 키 입력 시
    public func heightTextInput(_ text: String) {
        heightValidatedText.accept(validateUsecase.onlyDigit(text))
    }
    
    /// 몸무게 단위 선택 시
    public func weightButtonTapped(_ type: TwiceButtonCase) {
        weightButtonIsTapped.accept(type != .none)
    }
    
    /// 몸무게 입려 시
    public func weightTextInput(_ text: String) {
        weightValidatedText.accept(validateUsecase.onlyDigit(text))
    }
}
