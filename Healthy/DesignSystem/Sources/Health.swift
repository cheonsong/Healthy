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
        return .b2
    }
    
    var unit: String {
        switch self {
        case .water:
            return "L"
        case .steps:
            return "steps"
        case .calolies:
            return "kcal"
        case .sleep:
            return "hours"
        }
    }
    
    var lightColor: UIColor {
        return .b3
    }
    
    var deepColor: UIColor {
        return .b1
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
