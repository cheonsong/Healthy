//
//  DateModel.swift
//  Domain
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation

public struct DateModel {
    public var year: String
    public var month: String
    public var day: String
    
    public init(year: String, month: String, day: String) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    static func ==(left: DateModel, right: DateModel)-> Bool {
        return left.year == right.year && left.month == right.month && left.day == right.day
    }
}
