//
//  DailyWaterModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public struct DailyWaterModel {
    
    public var date: Int
    public var goal: Int
    public var preogress: Int
    public var isAchieve: Bool
    
    public init(date: Int, goal: Int, preogress: Int, isAchieve: Bool) {
        self.date = date
        self.goal = goal
        self.preogress = preogress
        self.isAchieve = isAchieve
    }
}
