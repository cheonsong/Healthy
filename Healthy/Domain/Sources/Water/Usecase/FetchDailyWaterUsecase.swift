//
//  FetchTodayWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift

public protocol FetchTodayWaterUsecaseProtocol {
    func execute()-> Single<DailyWaterModel?>
}

public class FetchTodayWaterUsecase: FetchTodayWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() -> Single<DailyWaterModel?> {
        return repository.fetchTodayWater(.today).map({$0.first ?? nil})
    }
}


