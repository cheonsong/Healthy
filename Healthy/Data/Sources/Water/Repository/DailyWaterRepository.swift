//
//  DailyWaterRepository.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import Domain
import RxSwift
import RealmSwift

public class DailyWaterRepository: WaterRepositoryProtocol {
    
    let storage = WaterSotrage()
    
    public init () {}
    
    public func fetchTodayWater(_ query: DailyWaterQuery) -> Single<[DailyWaterModel]> {
        return storage.read(query: query.query).map({ entities in
            entities.map { $0.toModel() }
        })
    }
    
    public func fetchMonthWater(_ query: DailyWaterQuery) -> Single<[DailyWaterModel]> {
        return storage.read(query: query.query).map({ entities in
            entities.map { $0.toModel() }
        })
    }
    
    public func saveTodayWater(data: Domain.DailyWaterModel) -> Single<DailyWaterModel> {
        return storage.update(data.toEntity()).map { $0.toModel() }
    }
    
}

extension DailyWaterQuery {
    var query: (Query<DailyWaterEntity>)-> Query<Bool> {
        switch self {
        case .today:
            return { $0.date == getDate() }
        case .month(let date):
            return { $0.date == $0.date }
        }
    }
    
    func getDate()-> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let str = formatter.string(from: Date())
        return Int(str) ?? 0
    }
}
