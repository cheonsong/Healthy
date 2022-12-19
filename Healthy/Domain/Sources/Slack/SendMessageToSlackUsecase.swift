//
//  SendMessageToSlackUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation
import RxSwift

public protocol SendMessageToSlackUsecaseProtocol {
    func send(category: String, message: String)-> Single<Bool>
}

public class SendMessageToSlackUsecase: SendMessageToSlackUsecaseProtocol {
    
    var repository: SlackRepositoryProtocol
    
    public init(repository: SlackRepositoryProtocol) {
        self.repository = repository
    }
    
    public func send(category: String, message: String)-> Single<Bool> {
        return repository.send(category: category, message: message)
    }
}
