//
//  WidgetExtension.swift
//  WidgetExtension
//
//  Created by cheonsong on 2022/12/28.
//

import WidgetKit
import SwiftUI
import Intents
import DesignSystem
import RealmSwift
import Data
import Domain

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), progress: 0)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, progress: 0)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        var realm: Realm {
            let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.cheonsong.healthy")
            let realmURL = container?.appendingPathComponent("default.realm")
            let config = Realm.Configuration(fileURL: realmURL, schemaVersion: 1)
            return try! Realm(configuration: config)
        }
        
        let entity = realm.objects(DailyWaterEntity.self).where {
            $0.date.year == DateModel.today.year && $0.date.month == DateModel.today.month && $0.date.day == DateModel.today.day
        }
        
        let progress: Double = Double((entity.first?.progress ?? 0) / (entity.first?.goal ?? 2))
        
        
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let entry = SimpleEntry(date: Date(), configuration: configuration, progress: progress)
        entries.append(entry)
        
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let progress: Double
}

struct WidgetExtension: Widget {
    let kind: String = "Water"
    
    var progress: Double = 0
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WaterEntryView(entry: entry)
        }
        .configurationDisplayName("Water")
        .description("View the current achievement.")
    }
}

struct WidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        WaterEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), progress: 0.10))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
