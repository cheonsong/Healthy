//
//  WaterEntryView.swift
//  Healthy
//
//  Created by cheonsong on 2022/12/28.
//

import SwiftUI
import WidgetKit

struct WaterEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            CircularProgressView(progress: 0.2)
            Image("icoWater")
                .renderingMode(.original)
                .foregroundColor(.white)
        }
    }
}
struct WaterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WaterEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
