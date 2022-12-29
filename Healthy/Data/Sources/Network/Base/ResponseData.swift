//
//  ResponseData.swift
//  Data
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import RxMoya
import RxSwift
import Moya
import Util
import SwiftyJSON

extension Response {
    func checkStatusCode() {
        Log.d(self.statusCode)
    }
}

extension Single<Response> {
    func toJSON()-> Single<JSON> {
        return self.map { JSON($0.data) }
    }
}
