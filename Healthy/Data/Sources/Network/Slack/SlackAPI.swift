//
//  SlackAPI.swift
//  Data
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Moya
import RxCocoa
import RxSwift
import SwiftyJSON
import Util

public struct SlackAPI: Networkable {
    typealias Target = SlackTargetType
    let disposeBag = DisposeBag()
    
    public func send(category: String, message: String) {
        makeProvider(token: Configure.getConfig(.slackBotToken)).request(.postMessage(category, message)) {
            switch ResponseData<JSON>.processJSONResponse($0) {
            case .success(let _):
                break
            case .failure(let _):
                break
            }
        }
    }
}
