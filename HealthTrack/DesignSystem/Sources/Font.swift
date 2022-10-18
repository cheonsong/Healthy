//
//  Font.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

extension UIFont {
    public static let bold25 = UIFont(name: "SUIT-Bold", size: 25)
    public static let bold20 = UIFont(name: "SUIT-Bold", size: 20)
    public static let bold16 = UIFont(name: "SUIT-Bold", size: 16)
    public static let bold10 = UIFont(name: "SUIT-Bold", size: 10)
    
    public static let regular10 = UIFont(name: "SUIT-Regular", size: 10)
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
