//
//  WaterRepository.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation
import RxSwift
import RxCocoa

public protocol WaterRepositoryProtocol {
    
    /// 오늘 마신 물 데이터를 요청합니다.
    func fetchTodayWater()-> Single<DailyWaterModel>
    
    /// 원하는 달에 마신 물 데이터를 요청합니다.
    func fetchMonthWater(_ query: Int)-> Single<[DailyWaterModel]>
    
    /// 오늘 마신 물 데이터를 저장합니다.
    func saveTodayWater(data: DailyWaterModel)-> Bool
}
