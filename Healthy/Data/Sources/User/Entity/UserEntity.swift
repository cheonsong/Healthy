//
//  UserEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class UserEntity: Object {
    @Persisted public var name: String
    @Persisted public var height: Int
    @Persisted public var weight: Int
    @Persisted public var age: Int
    @Persisted public var gender: String
    
    @Persisted public var water: WaterEntity
    
    public init(name: String,
                         height: Int,
                         weight: Int,
                         age: Int,
                         gender: String,
                         water: WaterEntity) {
        super.init()
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
        self.water = water
    }
}
