//
//  SlackRepository.swift
//  DataTests
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Domain

public class SlackRepository: SlackRepositoryProtocol {
    
    let slack = SlackAPI()
    
    public init() {}
    
    public func send(category: String, message: String) {
        slack.send(category: category, message: message)
    }
}
