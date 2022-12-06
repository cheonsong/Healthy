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
    var disposeBag = DisposeBag()
    
    private init() {
        userInfo.subscribe(onNext: { [weak self] model in
            self?.name.accept(model.name)
            self?.age.accept(model.age)
            self?.gender.accept(model.gender)
            self?.waterGoal.accept(model.water?.goal ?? 2)
        })
        .disposed(by: disposeBag)
    }
    
    // MARK: USER
    var name: BehaviorRelay<String> = .init(value: "")
    var age: BehaviorRelay<Int> = .init(value: 1)
    var gender: BehaviorRelay<String> = .init(value: "")
    var userInfo: BehaviorRelay<UserModel> = .init(value: UserModel())
    
    // MARK: WATER
    var waterGoal: BehaviorRelay<Float> = .init(value: 2)
    var waterToday: BehaviorRelay<Float> = .init(value: 0)
    var waterMontlyList: BehaviorRelay<[DailyWaterModel]> = .init(value: [])
}
