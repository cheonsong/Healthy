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
    
    func mappingToSwiftJSON()-> Single<JSON> {
        return .create { [weak self] single -> Disposable in
            guard let self = self else {
                return single(.failure(ServiceError.jsonParsingError)) as! Disposable
            }
            single(.success(JSON(self.data)))
            
            return Disposables.create()
        }
    }
}
