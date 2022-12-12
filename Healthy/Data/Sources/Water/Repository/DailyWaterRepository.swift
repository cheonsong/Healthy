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
import Util

public class DailyWaterRepository: WaterRepositoryProtocol {
    
    let storage: WaterSotrage
    var disposeBag = DisposeBag()
    
    public init() {
        self.storage = WaterSotrage()
    }
    
    public func fetchTodayWater(_ query: DailyWaterQuery) -> Single<[Domain.DailyWaterModel]> {
        return storage.read(query: query.query).map({ entities in
            entities.map { $0.toModel() }
        })
    }
    
    public func fetchMonthWater(_ query: DailyWaterQuery) -> Single<[Domain.DailyWaterModel]> {
        return storage.read(query: query.query).map({ entities in
            entities.map { $0.toModel() }
        })
    }
    
    public func saveTodayWater(data: Domain.DailyWaterModel) -> Single<Domain.DailyWaterModel> {
        var single: Single<Domain.DailyWaterModel>!
        storage.read(query: { $0.date.year == DateModel.today.year && $0.date.month == DateModel.today.month && $0.date.day == DateModel.today.day })
            .subscribe { [weak self] result in
                guard let self = self else { return }
                Log.d(result)
                switch result {
                case .success(let model):
                    if model.isEmpty {
                        let entity = data.toEntity()
                        entity.id = self.storage.lastID() + 1
                        single = self.storage.add(entity).map { $0.toModel() }
                    } else {
                        let entity = model.first!
                        let asdf = data.toEntity()
                        asdf.id = entity.id
                        
                        single = self.storage.update(asdf).map { $0.toModel() }
                    }
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        return single
    }
    
}

extension DailyWaterQuery {
    var query: (Query<DailyWaterEntity>)-> Query<Bool> {
        switch self {
        case .today:
            let today = DateModel.today
            return { $0.date.year == today.year && $0.date.month == today.month && $0.date.day == today.day}
        case .month(let year, let month):
            return { $0.date.month == month.rawValue && $0.date.year == year }
        }
    }
}
