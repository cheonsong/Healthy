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
            let today = getDate()
            return { $0.date.year == today.year && $0.date.month == today.month && $0.date.day == today.day}
        case .month(let year, let month):
            return { $0.date.month == month.rawValue && $0.date.year == year }
        }
    }
    
    func getDate()-> DateModel {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: Date())
        formatter.dateFormat = "MM"
        let month = formatter.string(from: Date())
        formatter.dateFormat = "dd"
        let day = formatter.string(from: Date())
        return DateModel(year: year, month: month, day: day)
    }
}
