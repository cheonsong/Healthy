//
//  UpdateUserInfoUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/12/05.
//

import Foundation
import RxSwift

public protocol UpdateUserInfoUsecaseProtocol {
    func excute(model: UserModel)-> Single<UserModel>
}

public class UpdateUserInfoUsecase: UpdateUserInfoUsecaseProtocol {
    
    var repository: UserRepositoryProtocol
    
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute(model: UserModel) -> Single<UserModel> {
        return repository.updateUserInfo(model: model)
    }
}
