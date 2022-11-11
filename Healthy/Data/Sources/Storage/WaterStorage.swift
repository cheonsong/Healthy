//
//  WaterStorage.swift
//  Data
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RxSwift
import Domain
import RealmSwift

public class WaterSotrage {
    private var helper = DBHelper<DailyWaterEntity>()
    
    public init() {
        
    }
    
    public func add(_ data: DailyWaterEntity)-> Single<DailyWaterEntity> {
        return helper.add(data)
    }
    
    public func update(_ data: DailyWaterEntity)-> Single<DailyWaterEntity> {
        return helper.update(data)
    }
    
    public func read(query: @escaping (Query<DailyWaterEntity>)-> Query<Bool>)-> Single<[DailyWaterEntity]> {
        
        return helper.readWithQuery(query: query)
    }
    
    func getDate()-> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let str = formatter.string(from: Date())
        return Int(str) ?? 0
    }
}


