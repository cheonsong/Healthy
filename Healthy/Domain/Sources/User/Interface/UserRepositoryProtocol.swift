//
//  UserRepositoryProtocol.swift
//  Domain
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RxSwift

public protocol UserRepositoryProtocol {
    func addUserInfo(model: UserModel)-> Single<UserModel>
    func fetchUserInfo()-> Single<[UserModel]>
    func updateUserInfo(model: UserModel)-> Single<UserModel>
    func initUserInfo()-> Single<Void>
}
