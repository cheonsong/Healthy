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
    var splashVC: SplashViewController
    var tabBarController: CustomTabBarController
    private let appDIContainer: AppDIContainer
    
    init(spalsh: SplashViewController, tabBarController: CustomTabBarController, appDIContainer: AppDIContainer) {
        self.splashVC = spalsh
        self.tabBarController = tabBarController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            let mainDIContainer = self.appDIContainer.makeMainDIContainer()
            let mainCoordinator = mainDIContainer.makeMainCoordinator(tabBarController: self.tabBarController)
            mainCoordinator.start()
            self.splashVC.dismiss(animated: false, completion: {
                self.splashVC.present(self.tabBarController, animated: false)
            })
        })
    }
}
