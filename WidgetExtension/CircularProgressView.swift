//
//  CircularProgressView.swift
//  WidgetExtension
//
//  Created by cheonsong on 2022/12/28.
//

import SwiftUI

struct CircularProgressView: View {
    
    let progress: Double
    
    var body: some View {
        ZStack {
            Color.b2
            Circle()
                .stroke(Color.b3, lineWidth: 15)
                .padding(20)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.b1,
                        style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .padding(20)
                .rotationEffect(.degrees(-90))
        }
    }
}
struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.5)
    }
}
