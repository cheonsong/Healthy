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
    public static let state = App()
    var disposeBag = DisposeBag()
    
    private init() {
        userInfo.subscribe(onNext: { [weak self] model in
            guard let model = model else { return }
            self?.name.accept(model.name)
            self?.age.accept(model.age)
            self?.gender.accept(model.gender)
            self?.waterGoal.accept(model.water?.goal ?? 2)
        })
        .disposed(by: disposeBag)
    }
    // MARK: DATE
    public var date: BehaviorRelay<DateModel> = .init(value: DateModel.today)
    
    // MARK: USER
    var name: BehaviorRelay<String> = .init(value: "")
    var age: BehaviorRelay<Int> = .init(value: 1)
    var gender: BehaviorRelay<String> = .init(value: "")
    var userInfo: BehaviorRelay<UserModel?> = .init(value: nil)
    
    // MARK: WATER
    var waterGoal: BehaviorRelay<Float> = .init(value: 2)
    var waterToday: BehaviorRelay<Float> = .init(value: 0)
    var waterMontlyList: BehaviorRelay<[Domain.DailyWaterModel]> = .init(value: [])
}
