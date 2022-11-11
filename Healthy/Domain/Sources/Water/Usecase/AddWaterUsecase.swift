//
//  AddWaterUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public protocol AddWaterUsecaseProtocol {
    func excute(data: DailyWaterModel)-> Bool
}

public class AddWaterUsecase: AddWaterUsecaseProtocol {
    
    var repository: WaterRepositoryProtocol
    
    public init(repository: WaterRepositoryProtocol) {
        self.repository = repository
    }
    
    public func excute(data: DailyWaterModel) -> Bool {
        return repository.saveTodayWater(data: data)
    }
}
