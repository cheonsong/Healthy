//
//  Configuration.swift
//  Util
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation

public enum ConfigureEnum {
    case slackChannel
    case slackBotToken
    
    var key: String {
        switch self {
        case .slackChannel:
            return "SlackChannel"
        case .slackBotToken:
            return "SlackBotUserToken"
        }
    }
}

public struct XCConfig {
    
    public static func config(_ config: ConfigureEnum)-> String {
        return Bundle.main.object(forInfoDictionaryKey: config.key) as? String ?? "Invalid Key"
    }
    
}
