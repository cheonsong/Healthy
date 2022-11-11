//
//  DailyWaterModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public enum DailyWaterQuery {
    case today
    case month(Int)
}

public struct DailyWaterModel {
    
    public var date: Int
    public var goal: Int
    public var progress: Int
    public var isAchieve: Bool
    
    public init(date: Int, goal: Int, progress: Int, isAchieve: Bool) {
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}
