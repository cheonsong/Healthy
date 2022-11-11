//
//  UserDataMapper.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import Domain

extension UserModel {
    public func toEntity() -> UserEntity {
        return UserEntity(name: self.name,
                          height: self.height,
                          weight: self.weight,
                          age: self.age,
                          gender: self.gender,
                          water: self.water.toEntity())
    }
}

extension UserEntity {
    public func toEntity()-> UserModel {
        return UserModel(name: self.name,
                         height: self.height,
                         weight: self.weight,
                         age: self.age,
                         gender: self.gender,
                         water: self.water.toModel())
    }
}
