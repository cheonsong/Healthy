//
//  SlackRepository.swift
//  DataTests
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Domain
import RxSwift
import RxCocoa
import Util
import SwiftyJSON
import RxMoya
import Moya


public class SlackRepository: SlackRepositoryProtocol, Networkable {
    
    public typealias Target = SlackTargetType
    let disposeBag = DisposeBag()
    
    var provider: MoyaProvider<SlackTargetType>
    
    public init(provider: MoyaProvider<SlackTargetType>) {
        self.provider = provider
    }
    
    public func send(category: String, message: String) -> Single<Bool> {
        return provider.rx.request(.postMessage(category, message))
            .flatMap { $0.mappingToSwiftJSON() }
            .flatMap { data -> Single<Bool> in
                return Single.create { single -> Disposable in
                    // 응답 데이터를 JSON객체로 파싱
                    single(.success(data["ok"].boolValue))
                    
                    return Disposables.create()
                }
            }
    }
}
