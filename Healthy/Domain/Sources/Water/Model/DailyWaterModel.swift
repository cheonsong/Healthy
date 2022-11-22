//
//  DailyWaterModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public enum DailyWaterQuery {
    case today
    case month(String, Month)
}

public struct DailyWaterModel {
    
    public var date: DateModel?
    public var goal: Float
    public var progress: Float
    public var isAchieve: Bool
    
    public init(date: DateModel?, goal: Float, progress: Float, isAchieve: Bool) {
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}

public enum Month: String {
    case january = "01"
    case feburary = "02"
    case march = "03"
    case april = "04"
    case may = "05"
    case june = "06"
    case july = "07"
    case august = "08"
    case september = "09"
    case october = "10"
    case november = "11"
    case december = "12"
}
