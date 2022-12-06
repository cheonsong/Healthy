//
//  String+.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/25.
//

import Foundation

extension Float {
    /// float을 소수두째자리까지 잘라서 문자열로 변환
    public var secondDemical: String {
        var value = String(format: "%.2f", self)
        
        if value.last == "0" {
            value.removeLast()
        }
        
        return value
    }
}
