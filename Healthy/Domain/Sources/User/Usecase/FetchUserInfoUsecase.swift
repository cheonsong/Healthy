//
//  FetchUserInfoUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation
import RxSwift

public protocol FetchUserInfoUsecaseProtocol {
    func excute()-> Single<[UserModel]>
}

public class FetchUserInfoUsecase: FetchUserInfoUsecaseProtocol {
    
    var repository: UserRepositoryProtocol
    
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute() -> Single<[UserModel]> {
        return repository.fetchUserInfo()
    }
}
