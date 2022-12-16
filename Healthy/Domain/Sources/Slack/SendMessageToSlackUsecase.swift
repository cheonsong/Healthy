//
//  SendMessageToSlackUsecase.swift
//  Domain
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation

public protocol SendMessageToSlackUsecaseProtocol {
    func send(message chat: String)
}

public class SendMessageToSlackUsecase: SendMessageToSlackUsecaseProtocol {
    
    let bot: SlackBot?
    
    public init() {
        bot = SlackBot()
    }
    
    public func send(message chat: String) {
        bot?.send(chat)
    }
}
