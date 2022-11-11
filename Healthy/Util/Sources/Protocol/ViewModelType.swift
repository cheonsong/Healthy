//
//  ViewModelType.swift
//  Util
//
//  Created by cheonsong on 2022/10/28.
//

import Foundation

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get set }
    var output: Output { get set }
}
