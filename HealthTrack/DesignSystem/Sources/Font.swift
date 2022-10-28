//
//  Font.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

extension UIFont {
    public static let bold25 = DesignSystemFontFamily.Suit.bold.font(size: 25)
    public static let bold20 = DesignSystemFontFamily.Suit.bold.font(size: 20)
    public static let bold16 = DesignSystemFontFamily.Suit.bold.font(size: 16)
    public static let bold10 = DesignSystemFontFamily.Suit.bold.font(size: 10)
    
    public static let regular20 = DesignSystemFontFamily.Suit.regular.font(size: 20)
    public static let regular16 = DesignSystemFontFamily.Suit.regular.font(size: 16)
    public static let regular10 = DesignSystemFontFamily.Suit.regular.font(size: 10)
}

public struct FontManagser{
    
    public static func suit(type: Suit, size: CGFloat)-> UIFont? {
        return UIFont(name: "SUIT-\(type.rawValue)", size: size)
    }
    
}

public enum Suit: String {
    case thin = "Thin"
    case regular = "Regular"
    case heavy = "Heavy"
    case bold = "Bold"
    case light = "Light"
    case semiBold = "SemiBold"
    case medium = "Medium"
    case extraBold = "ExtraBold"
    case extraLight = "ExtraLight"
}
