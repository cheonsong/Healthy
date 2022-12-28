//
//  WidgetExtensionLiveActivity.swift
//  WidgetExtension
//
//  Created by cheonsong on 2022/12/28.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetExtensionLiveActivity: Widget {
    private let kind: String = "SimpleTodoWidget"
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(), content: {
            WidgetExtensionEntryView(entry: $0)
        })
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
//
//struct WidgetExtensionLiveActivity_Previews: PreviewProvider {
//    static let attributes = WidgetExtensionAttributes(name: "Me")
//    static let contentState = WidgetExtensionAttributes.ContentState(value: 3)
//
//    @available(iOSApplicationExtension 16.2, *)
//    static var previews: some View {
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
//            .previewDisplayName("Island Compact")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
//            .previewDisplayName("Island Expanded")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
//            .previewDisplayName("Minimal")
//        attributes
//            .previewContext(contentState, viewKind: .content)
//            .previewDisplayName("Notification")
//    }
//}
