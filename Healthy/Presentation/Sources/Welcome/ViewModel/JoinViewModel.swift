//
//  JoinViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/21.
//

import Foundation
import Util
import Domain

public protocol JoinViewModelAction {
    func moveToMain()
}

public protocol JoinViewModelInput {
    func completeButtonTapped(model: UserModel)
}

public protocol JoinViewModelOutput {
    
}

public class JoinViewModel: JoinViewModelOutput {
    
    var validateUsecase: ValidationUseCaseProtocol
    var action:JoinViewModelAction
    
    public init(validate: ValidationUseCaseProtocol,
                action: JoinViewModelAction) {
        self.validateUsecase = validate
        self.action = action
    }
}

extension JoinViewModel: JoinViewModelInput {
    public func completeButtonTapped(model: UserModel) {
        action.moveToMain()
    }
}
