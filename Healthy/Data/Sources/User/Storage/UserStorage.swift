//
//  UserStorage.swift
//  Data
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation
import RxSwift

public class UserSotrage {
    private var helper = DBHelper<UserEntity>()
    
    public init() {
        
    }
    
    public func add(_ data: UserEntity)-> Single<UserEntity> {
        return helper.add(data)
    }
    
    public func update(_ data: UserEntity)-> Single<UserEntity> {
        return helper.update(data)
    }
    
    public func read()-> Single<[UserEntity]> {
        return helper.read()
    }
}
