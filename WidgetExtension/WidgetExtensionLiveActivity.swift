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
    private let kind: String = "WaterWidget"
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(), content: {
            WaterEntryView(entry: $0)
        })
        .configurationDisplayName("Water")
        .description("View the current achievement.")
    }
}

struct WidgetExtensionLiveActivity_Previews: PreviewProvider {
    
    static var previews: some View {
        WaterEntryView(entry: SimpleEntry(date: Date(),
                                                    configuration: ConfigurationIntent()))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

extension String {
    
}


