//
//  UserStorage.swift
//  Data
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation
import RxSwift
import RealmSwift

public class UserSotrage {
    private var helper = DBHelper<UserEntity>()
    
    public init() {
        
    }
    
    public func add(_ data: UserEntity)-> Single<UserEntity> {
        data.id = 1
        return helper.add(data)
    }
    
    public func update(_ data: UserEntity)-> Single<UserEntity> {
        data.id = 1
        return helper.update(data)
    }
    
    public func read()-> Single<[UserEntity]> {
        return helper.read()
    }
    
    public func removeAll()-> Single<Void> {
        return helper.deleteAll()
    }
    
    public func add_Test(_ data: UserEntity)-> Single<UserEntity> {
        data.id = 2
        return helper.add(data)
    }
    
    public func update_Test(_ data: UserEntity)-> Single<UserEntity> {
        data.id = 2
        return helper.update(data)
    }
    
    public func delete_Test(_ data: UserEntity) async-> Single<Bool> {
        return await helper.delete(try! helper.readWithQuery(query: {$0.id == 2}).value.first!)
    }
}
