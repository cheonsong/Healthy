//
//  UserRepositoryProtocol.swift
//  Domain
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RxSwift

public protocol UserRepositoryProtocol {
    func saveUserInfo(model: UserModel)-> Single<UserModel>
}
