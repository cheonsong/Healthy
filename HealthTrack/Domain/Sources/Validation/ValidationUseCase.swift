//
//  ValidationUseCase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public protocol ValidationUseCaseProtocol {
    func excute(_ text: String)-> String
}

public class ValidationUseCase: ValidationUseCaseProtocol {
    
    public init() { }
    
    public func excute(_ text: String) -> String {
        if text == "0" { return "" }
        
        return text.filter{ $0.isNumber }
    }
}
