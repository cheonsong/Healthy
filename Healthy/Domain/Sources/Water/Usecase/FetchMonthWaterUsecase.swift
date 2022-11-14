//
//  FetchMonthWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift

public protocol FetchMonthWaterUsecaseProtocol {
    func execute(query: Month)-> Single<[DailyWaterModel]>
}

public class FetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(query: Month) -> Single<[DailyWaterModel]> {
        return repository.fetchMonthWater(.month(query))
    }
}
