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
    private var disposeBag = DisposeBag()
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
    
    public func readAll()-> Single<[DailyWaterEntity]> {
        return helper.read()
    }
    
    public func lastID()-> Int {
        
        return helper.lastID()
    }
}


