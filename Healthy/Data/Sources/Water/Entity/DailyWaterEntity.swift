//
//  DailyWaterEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class DailyWaterEntity: Object {
    @Persisted public var date: DateEntity?
    @Persisted public var goal: Float
    @Persisted public var progress: Float
    @Persisted public var isAchieve: Bool
    
    override init() {
        super.init()
    }
    
    public init(date: DateEntity?, goal: Float, progress: Float, isAchieve: Bool) {
        super.init()
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}
