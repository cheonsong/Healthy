//
//  UserEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class UserEntity: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted public var name: String
    @Persisted public var height: Int
    @Persisted public var heightUnit: String
    @Persisted public var weight: Int
    @Persisted public var weightUnit: String
    @Persisted public var age: Int
    @Persisted public var gender: String
    
    @Persisted public var water: WaterEntity?
    
    override init() {
        super.init()
    }
    
    public init(name: String,
                height: Int,
                heightUnit: String,
                weight: Int,
                weightUnit: String,
                age: Int,
                gender: String,
                water: WaterEntity?) {
        super.init()
        self.name = name
        self.height = height
        self.heightUnit = heightUnit
        self.weight = weight
        self.weightUnit = weightUnit
        self.age = age
        self.gender = gender
        self.water = water
    }
}
