//
//  AppCoordinator.swift
//  App
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import Presentation

class AppCordinator {
    var tabBarController: CustomTabBarController
    private let appDIContainer: AppDIContainer
    
    init(tabBarController: CustomTabBarController, appDIContainer: AppDIContainer) {
        self.tabBarController = tabBarController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainDIContainer = appDIContainer.makeMainDIContainer()
        let mainCoordinator = mainDIContainer.makeMainCoordinator(tabBarController: tabBarController)
        mainCoordinator.start()
    }
}
