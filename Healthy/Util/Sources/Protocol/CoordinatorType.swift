//
//  CoordinatorType.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import Foundation
import UIKit

public protocol CoordinatorType: AnyObject {
    var childCoordinators: [CoordinatorType] { get set }
    
    func start()
}
