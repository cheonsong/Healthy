//
//  ServiceError.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/31.
//

import Foundation
import Moya

// back-end 팀과 정의한 에러 내용
enum ServiceError: Error {
    case moyaError(MoyaError)
    case invalidResponse(responseCode: Int, message: String)
    case tokenExpired
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .moyaError(let moyaError):
            return moyaError.localizedDescription
        case let .invalidResponse(_, message):
            return message
        case .tokenExpired:
            return "AccessToken Expired"
        }
    }
}
