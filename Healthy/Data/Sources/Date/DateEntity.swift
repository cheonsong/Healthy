//
//  DateEntity.swift
//  Data
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation
import RealmSwift

public class DateEntity: Object {
    @Persisted public var year: String
    @Persisted public var month: String
    @Persisted public var day: String
    
    override init() {
        super.init()
    }
    
    public init(year: String, month: String, day: String) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    static func ==(left: DateEntity, right: DateEntity)-> Bool {
        if left.year == right.year,
           left.month == right.month,
           left.day == right.day {
            return true
        } else {
            return false
        }
    }
}
