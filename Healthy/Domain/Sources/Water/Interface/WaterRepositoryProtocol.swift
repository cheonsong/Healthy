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
    func fetchTodayWater(_ query: DailyWaterQuery) -> Single<[DailyWaterModel]>
    
    /// 원하는 달에 마신 물 데이터를 요청합니다.
    func fetchMonthWater(_ query: DailyWaterQuery) -> Single<[DailyWaterModel]>
    
    /// 오늘 마신 물 데이터를 저장합니다.
    func saveTodayWater(data: DailyWaterModel) -> Single<DailyWaterModel>
}
