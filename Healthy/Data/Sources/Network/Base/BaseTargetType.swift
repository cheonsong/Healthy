//
//  BaseTargetType.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/31.
//

import Moya
import Foundation
import Util

protocol BaseSlackTargetType: TargetType, AccessTokenAuthorizable {
}

extension BaseSlackTargetType {
    public var baseURL: URL {
        // Configuration을 통해 phase별 baseURL 설정 방법: https://ios-development.tistory.com/660
//        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String else { fatalError("API URL not defined")}
//        gaurd let apiURL = URL(string: urlString) else { fatalError("URL is invalid") }

        return URL(string: Host.slack)!
    }
    
    // HTTP header
    //  return ["Content-type": "application/json"]
    public var headers: [String : String]? {
        return ["Content-type": "application/json; charset=utf-8"]
    }
    
    
    // 테스트용 Mock Data
    public var sampleData: Data {
        return Data()
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
