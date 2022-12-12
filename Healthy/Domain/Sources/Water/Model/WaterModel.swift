//
//  WaterModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public struct WaterModel {
    
    public var unit: String
    public var goal: Float
    
    public init(unit: String, goal: Float) {
        self.unit = unit
        self.goal = goal
    }
}
