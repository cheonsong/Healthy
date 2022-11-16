//
//  WaterEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift

public class WaterEntity: Object {
    @Persisted var unit: String
    @Persisted var goal: Float
    
    public init(unit: String, goal: Float) {
        self.unit = unit
        self.goal = goal
    }
}
