//
//  State.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/16.
//

import Foundation
import Util
import RxSwift
import RxCocoa
import Domain

public class App {
    static let state = App()
    private init() {}
    
    // MARK: USER
    var name: BehaviorRelay<String> = .init(value: "")
    var age: BehaviorRelay<Int> = .init(value: 1)
    var gender: BehaviorRelay<String> = .init(value: "")
    
    // MARK: WATER
    var waterGoal: BehaviorRelay<Float> = .init(value: 2)
    var waterToday: BehaviorRelay<Float> = .init(value: 0)
    var waterMontlyList: BehaviorRelay<[DailyWaterModel]> = .init(value: [])
}
