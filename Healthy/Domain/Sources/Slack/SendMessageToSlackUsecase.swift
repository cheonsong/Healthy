//
//  SendMessageToSlackUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation

public protocol SendMessageToSlackUsecaseProtocol {
    func send(category: String, message: String)
}

public class SendMessageToSlackUsecase: SendMessageToSlackUsecaseProtocol {
    
    var repository: SlackRepositoryProtocol
    
    public init(repository: SlackRepositoryProtocol) {
        self.repository = repository
    }
    
    public func send(category: String, message: String) {
        repository.send(category: category, message: message)
    }
}
