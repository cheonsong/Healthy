//
//  DailyWaterEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class DailyWaterEntity: Object {
    @objc dynamic public var id: Int = 0
    @objc dynamic public var date: DateEntity?
    @objc dynamic public var goal: Float = 0
    @objc dynamic public var progress: Float = 0
    @objc dynamic public var isAchieve: Bool = false
    
    override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    public init(date: DateEntity?, goal: Float, progress: Float, isAchieve: Bool) {
        super.init()
        self.date = date
        self.goal = goal
        self.progress = progress
        self.isAchieve = isAchieve
    }
}
