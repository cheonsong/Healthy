//
//  WidgetExtensionBundle.swift
//  WidgetExtension
//
//  Created by cheonsong on 2022/12/28.
//

import WidgetKit
import SwiftUI

@main
struct WidgetExtensionBundle: WidgetBundle {
    var body: some Widget {
        WidgetExtension()
        WidgetExtensionLiveActivity()
    }
}
