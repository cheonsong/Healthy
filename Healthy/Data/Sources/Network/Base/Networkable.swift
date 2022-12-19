//
//  Networkable.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/31.
//

import Foundation
import RxMoya
import Moya
import Util

public protocol Networkable {
    /// provider객체 생성 시 Moya에서 제공하는 TargetType을 명시해야 하므로 타입 필요
    associatedtype Target: TargetType
    /// DIP를 위해 protocol에 provider객체를 만드는 함수 정의
    static func makeProvider(token: String) -> MoyaProvider<Target>
}

extension Networkable {
    
    public static func makeProvider(token: String) -> MoyaProvider<Target> {
        /// access token 세팅
        let accessPlugin = AccessTokenPlugin { _ in
            return token
        }
      /// plugin객체를 주입하여 provider 객체
        return MoyaProvider<Target>(plugins: [accessPlugin])
    }
}
