//
//  WaterEntryView.swift
//  Healthy
//
//  Created by cheonsong on 2022/12/28.
//

import SwiftUI
import WidgetKit
import Domain
import Data
import RxSwift
import RealmSwift

struct WaterEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            CircularProgressView(progress: entry.progress)
            Image("icoWater")
                .renderingMode(.original)
                .foregroundColor(.white)
        }
    }
}
struct WaterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WaterEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), progress: 0.1))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
