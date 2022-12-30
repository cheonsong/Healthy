//
//  UserModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation

public struct UserModel: Equatable {
    
    public var name: String
    public var height: Int
    public var heightUnit: String
    public var weight: Int
    public var weightUnit: String
    public var age: Int
    public var gender: String
    
    public var water: WaterModel?

    public init(name: String, height: Int, heightUnit: String, weight: Int, weightUnit: String, age: Int, gender: String, water: WaterModel?) {
        self.name = name
        self.height = height
        self.heightUnit = heightUnit
        self.weight = weight
        self.weightUnit = weightUnit
        self.age = age
        self.gender = gender
        self.water = water
    }
    
    public init() {
        self.name = ""
        self.height = 0
        self.heightUnit = ""
        self.weight = 0
        self.weightUnit = ""
        self.age = 1
        self.gender = ""
        self.water = nil
    }
    
    public static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.name == rhs.name && lhs.height == rhs.height && lhs.heightUnit == rhs.heightUnit && lhs.weight == rhs.weight && lhs.weightUnit == rhs.weightUnit && lhs.age == rhs.age && lhs.gender == rhs.gender && lhs.water == rhs.water && lhs.name == rhs.name
    }
    
}
