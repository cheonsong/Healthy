//
//  FetchTodayWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift

public protocol FetchTodayWaterUsecaseProtocol {
    func execute()-> Single<DailyWaterModel>
}

public class FetchTodayWaterUsecase: FetchTodayWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> Single<DailyWaterModel> {
        return repository.fetchTodayWater(.today).map({$0.first ?? DailyWaterModel(date: self.getDate(),
                                                                                   goal: 2000,
                                                                                   progress: 0,
                                                                                   isAchieve: false)})
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


