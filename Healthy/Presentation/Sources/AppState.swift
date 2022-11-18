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

public class App {
    static let state = App()
    private init() {}
    
    // MARK: WATER
    var waterGoal: BehaviorRelay<Float> = .init(value: 2)
    var waterToday: BehaviorRelay<Float> = .init(value: 0)
}
