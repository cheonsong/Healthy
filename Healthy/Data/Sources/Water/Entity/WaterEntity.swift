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
    @Persisted var goal: Int
    
    public init(unit: String, goal: Int) {
        self.unit = unit
        self.goal = goal
    }
}
