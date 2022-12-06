//
//  String+.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/25.
//

import Foundation

extension Float {
    /// float을 소수두째자리까지 잘라서 문자열로 변환
    public var secondDecimal: String {
        var value = String(format: "%.2f", self)
        
        if value.last == "0" {
            value.removeLast()
        }
        
        return value
    }
    
    /// 소수점 아래로 값이 있는지 없는지 체크 (주의: 최대 두째자리까지만 검사)
    public var hasDecimalNumber: Bool {
        let value = Int(self * 100) % 100
        
        return value == 0 ? false : true
    }
}
