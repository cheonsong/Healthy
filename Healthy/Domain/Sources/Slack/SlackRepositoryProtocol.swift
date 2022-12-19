//
//  SlackRepositoryProtocol.swift
//  Domain
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Util
import RxSwift

public protocol SlackRepositoryProtocol {
    func send(category: String, message: String) -> Single<Bool>
}
