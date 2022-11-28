//
//  WaterDataMapper.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import Domain

extension DailyWaterEntity {
    public func toModel()-> DailyWaterModel {
        return DailyWaterModel(date: self.date?.toModel() ?? DateModel.today,
                               goal: self.goal,
                               progress: self.progress,
                               isAchieve: self.isAchieve)
    }
}

extension DailyWaterModel {
    public func toEntity()-> DailyWaterEntity {
        return DailyWaterEntity(date: self.date?.toEntity() ?? DateModel.today.toEntity(),
                                goal: self.goal,
                                progress: self.progress,
                                isAchieve: self.isAchieve)
    }
}

extension WaterEntity {
    public func toModel()-> WaterModel {
        return WaterModel(unit: self.unit, goal: self.goal)
    }
}

extension WaterModel {
    public func toEntity()-> WaterEntity {
        return WaterEntity(unit: self.unit, goal: self.goal)
    }
}
