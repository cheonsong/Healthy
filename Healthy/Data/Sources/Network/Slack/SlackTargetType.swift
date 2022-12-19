//
//  SlackTargetType.swift
//  Data
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Moya
import Domain
import Util

enum SlackTargetType {
    case postMessage(String, String)
}

extension SlackTargetType: BaseSlackTargetType {
    
    var path: String {
        switch self {
        case .postMessage(_, _):
            return "/chat.postMessage"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postMessage(_, _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postMessage(let category, let message):
            let date = "\(DateModel.today.year)-\(DateModel.today.month)-\(DateModel.today.day)"
            
            return .requestJSONEncodable(SlackMessageModel(channel: Configure.getConfig(.slackChannel), date: date, category: category, message: message))
        }
    }
}

struct SlackMessageModel: Encodable {
    var channel: String
    var date: String
    var blocks: [SectionModel]
    
    init(channel: String, date: String, category: String, message: String) {
        print(channel)
        print(date)
        print(message)
        self.channel = channel
        self.date = date
        self.blocks = [SectionModel(text: TextModel(text: "\n*유형 : \(category)*")),
                       SectionModel(text: TextModel(text: "시간 : \(date)")),
                       SectionModel(text: TextModel(text: message)),
                       SectionModel(text: TextModel(text: "===================================================================="))
        ]
    }

}

struct SectionModel: Encodable {
    var type: String = "section"
    var text: TextModel
    
    init(text: TextModel) {
        self.text = text
    }
}

struct TextModel: Encodable {
    var type: String = "mrkdwn"
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
