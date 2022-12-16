//
//  SlackAPI.swift
//  Data
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation
import SlackKit
import Util

public class SlackBot {
    let bot: SlackKit
    
    init() {
        guard let info = Bundle.main.infoDictionary,
              let token = info["SlackBotToken"] as? String,
              let userToken = info["SlackBotUserToken"] as? String,
              let clientID = info["SlackClientID"] as? String,
              let clientSecret = info["SlackClientSecret"] as? String else {
            bot = SlackKit()
            return
        }
        
        bot = SlackKit()
//        bot.addRTMBotWithAPIToken(userToken)
        bot.addWebAPIAccessWithToken(token)
//        let oauthConfig = OAuthConfig(clientID: clientID, clientSecret: clientSecret)
//        bot.addServer(oauth: oauthConfig)
        bot.webAPI?.authenticationTest(success: {
            print($0)
            print($1)
        }, failure: {
            print($0)
        })
    }
    // MARK: Bot logic
    public func send(_ message: String) {
        bot.webAPI?.sendMessage(channel: "C04FTCBNMB2", text: message, success: nil, failure: nil)
    }
}
