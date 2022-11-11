//
//  Const.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

public struct Const {
    public static let padding: CGFloat = 30
    public static let fullWidth: CGFloat = UIScreen.main.bounds.width - padding * 2
    
    public static let mainViewHeight: CGFloat = 150
    
    public static let modalHeight: CGFloat = 320 + safeAreaBottom
    public static let modalHeightLong: CGFloat = 370 + safeAreaBottom
    public static let modalWidth: CGFloat = UIScreen.main.bounds.width
    
    public static let safeAreaTop = (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0)
    public static let safeAreaBottom = (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0)
    
    public static let calendarCellSize = (fullWidth - 30) / 7
}
