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
    
    public static var today: DateModel {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: Date())
        formatter.dateFormat = "MM"
        let month = formatter.string(from: Date())
        formatter.dateFormat = "dd"
        let day = formatter.string(from: Date())
        return DateModel(year: year, month: month, day: day)
    }
    
    public static func ==(left: DateModel, right: DateModel)-> Bool {
        return left.year == right.year && left.month == right.month && left.day == right.day
    }
}
