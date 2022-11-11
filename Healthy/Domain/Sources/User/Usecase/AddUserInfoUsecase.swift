//
//  AddUserInfoUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RxSwift

public protocol AddUserInfoUsecaseProtocol {
    func excute(model: UserModel)-> Single<UserModel>
}

public class AddUserInfoUsecase: AddUserInfoUsecaseProtocol {
    
    var repository: UserRepositoryProtocol
    
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute(model: UserModel) -> Single<UserModel> {
        return repository.saveUserInfo(model: model)
    }
}
