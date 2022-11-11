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
    public var weight: Int
    public var age: Int
    public var gender: String
    
    public var water: WaterModel

    public init(name: String, height: Int, weight: Int, age: Int, gender: String, water: WaterModel) {
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
        self.water = water
    }
}
