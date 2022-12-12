//
//  AddWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift

public protocol AddWaterUsecaseProtocol {
    func excute(data: Domain.DailyWaterModel)-> Single<Domain.DailyWaterModel>
}

public class AddWaterUsecase: AddWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute(data: Domain.DailyWaterModel) -> Single<Domain.DailyWaterModel> {
        return repository.saveTodayWater(data: data)
    }
}
