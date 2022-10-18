//
//  Health.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

public enum Health: String {
    case water
    case steps
    case calolies
    case sleep
    
    var text: String { return self.rawValue.uppercased() }
    
    var mainColor: UIColor {
        switch self {
        case .water:
            return .b2
        case .steps:
            return .r2
        case .calolies:
            return .g2
        case .sleep:
            return .y2
        }
    }
    
    var unit: String {
        switch self {
        case .water:
            return "ml"
        case .steps:
            return "steps"
        case .calolies:
            return "kcal"
        case .sleep:
            return "hours"
        }
    }
    
    var lightColor: UIColor {
        switch self {
        case .water:
            return .b3
        case .steps:
            return .r3
        case .calolies:
            return .g3
        case .sleep:
            return .y3
        }
    }
    
    var deepColor: UIColor {
        switch self {
        case .water:
            return .b1
        case .steps:
            return .r1
        case .calolies:
            return .g1
        case .sleep:
            return .y1
        }
    }
    
    var icon: UIImage {
        switch self {
        case .water:
            return DesignSystemAsset.icoWater.image
        case .steps:
            return DesignSystemAsset.icoSteps.image
        case .calolies:
            return DesignSystemAsset.icoCalories.image
        case .sleep:
            return DesignSystemAsset.icoSleep.image
        }
    }
}
