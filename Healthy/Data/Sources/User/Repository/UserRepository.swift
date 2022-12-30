//
//  UserRepository.swift
//  Data
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation
import Domain
import RxSwift

public class UserRepository: UserRepositoryProtocol {
    
    let storage: UserSotrage
    var disposeBag = DisposeBag()
    
    public init() {
        self.storage = UserSotrage()
    }
    
    public func addUserInfo(model: UserModel)-> Single<UserModel> {
        return storage.add(model.toEntity()).map{ $0.toModel() }
    }
    
    public func fetchUserInfo()-> Single<[UserModel]> {
        return storage.read().map ({ entities in
            entities.map {
                $0.toModel()
            }
        })
    }
    
    public func updateUserInfo(model: UserModel) -> Single<UserModel> {
        return storage.update(model.toEntity()).map{ $0.toModel() }
    }
    
    public func initUserInfo()-> Single<Void> {
        return storage.removeAll()
    }
}

extension UserRepository {
    public func addUserInfo_Test(model: UserModel)-> Single<UserModel> {
        return storage.add_Test(model.toEntity()).map{ $0.toModel() }
    }
    
    public func updateUserInfo_Test(model: UserModel)-> Single<UserModel> {
        return storage.update_Test(model.toEntity()).map { $0.toModel() }
    }
    
    public func deleteUserInfo_Test(model: UserModel) async-> Single<Bool> {
        return await storage.delete_Test(model.toEntity())
    }
}
