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
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(spalsh: SplashViewController, navigation: UINavigationController, appDIContainer: AppDIContainer) {
        self.splashVC = spalsh
        self.appDIContainer = appDIContainer
        self.navigationController = navigation
    }
    
    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            let welcomeDIContainer = WelcomeDIContainer()
            let coordinator = welcomeDIContainer.makeWelcomeCoordinator(navigation: self.navigationController)
            coordinator.start()
        })
    }
}
