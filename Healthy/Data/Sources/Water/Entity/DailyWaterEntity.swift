//
//  DailyWaterEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class DailyWaterEntity: Object {
    @Persisted public var date: DateEntity
    @Persisted public var goal: Int
    @Persisted public var progress: Int
    @Persisted public var isAchieve: Bool
    
    public init(date: DateEntity, goal: Int, progress: Int, isAchieve: Bool) {
        super.init()
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}
