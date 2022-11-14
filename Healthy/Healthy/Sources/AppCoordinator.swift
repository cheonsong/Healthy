//
//  AppCoordinator.swift
//  App
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import Presentation

class AppCordinator: NSObject {
    private let appDIContainer: AppDIContainer = .init()
    
    var window: UIWindow
    var navigation: UINavigationController
    
    init(window : UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigation = navigationController
        super.init()
    }
    
    func start() {
        let splashVC = SplashViewController()
        navigation.pushViewController(splashVC, animated: false)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            let mainDIContainer = self.appDIContainer.makeMainDIContainer()
            let mainCoordinator = mainDIContainer.makeMainCoordinator(navigationController: self.navigation)
            mainCoordinator.start()
        })
    }
}
