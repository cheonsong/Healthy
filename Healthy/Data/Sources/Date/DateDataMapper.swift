//
//  DateDataMapper.swift
//  Data
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation
import Domain

extension DateModel {
    public func toEntity()-> DateEntity {
        return DateEntity(year: self.year,
                          month: self.month,
                          day: self.day)
    }
}

extension DateEntity {
    public func toModel()-> DateModel {
        return DateModel(year: self.year,
                         month: self.month,
                         day: self.day)
    }
}
