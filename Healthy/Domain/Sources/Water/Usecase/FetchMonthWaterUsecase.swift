//
//  FetchMonthWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift

public protocol FetchMonthWaterUsecaseProtocol {
    func execute(year: String, month: Month)-> Single<[Domain.DailyWaterModel]>
}

public class FetchMonthWaterUsecase: FetchMonthWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(year: String, month: Month) -> Single<[Domain.DailyWaterModel]> {
        return repository.fetchMonthWater(.month(year, month))
    }
}
