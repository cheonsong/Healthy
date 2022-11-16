//
//  DateConveter.swift
//  Util
//
//  Created by cheonsong on 2022/11/16.
//

import Foundation

public struct DateConverter {
    public static func currentYear()-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: Date())
        return year
    }
    
    public static func currentMonth()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let month = formatter.string(from: Date())
        return month
    }
    
    public static func currentDay()-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let day = formatter.string(from: Date())
        return day
    }
}
