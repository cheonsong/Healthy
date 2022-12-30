//
//  ValidationUseCase.swift
//  Domain
//
//  Created by cheonsong on 2022/11/10.
//

import Foundation

public protocol ValidationUseCaseProtocol {
    func onlyDigit(_ text: String)-> String
    func nameValidation(_ text: String)-> String
}

public class ValidationUseCase: ValidationUseCaseProtocol {
    
    public init() { }
    
    public func onlyDigit(_ text: String)-> String {
        if text == "0" { return "" }
        
        return text.filter{ $0.isNumber }
    }
    
    public func nameValidation(_ text: String)-> String {
        var text = text
        
        if text == " " { return "" }
        
        if text.count > 15 {
            text = String(text[text.startIndex..<text.index(text.startIndex, offsetBy: 15)])
        }
        
        return text
    }
}
