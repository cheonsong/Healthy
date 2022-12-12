//
//  InitUserInfoUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/12/06.
//

import Foundation
import RxSwift

public protocol InitUserInfoUsecaseProtocol {
    func excute()-> Single<Void>
}

public class InitUserInfoUsecase: InitUserInfoUsecaseProtocol {
    
    var repository: UserRepositoryProtocol
    
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute()-> Single<Void>  {
        return repository.initUserInfo()
    }
}
