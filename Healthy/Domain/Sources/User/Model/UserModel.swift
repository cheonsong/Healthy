//
//  UserModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation

public struct UserModel {
    
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
}
