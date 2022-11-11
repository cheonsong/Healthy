//
//  DailyWaterEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class DailyWaterEntity: Object {
    @Persisted(primaryKey: true) var date: Int
    @Persisted var goal: Int
    @Persisted var progress: Int
    @Persisted var isAchieve: Bool
    
    public init(date: Int, goal: Int, progress: Int, isAchieve: Bool) {
        super.init()
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}
