//
//  WelcomeDIContainer.swift
//  Healthy
//
//  Created by cheonsong on 2022/11/18.
//

import Foundation
import Presentation
import UIKit

final class WelcomeDIContainer {
    init() {}
    
    func makeWelcomeCoordinator(navigation: UINavigationController)-> WelcomeCoordinator {
        return WelcomeCoordinator(navigationController: navigation, dependencies: self)
    }
}

extension WelcomeDIContainer: WelcomCoordinatorDependencies {
    func makeWelcomeViewController(action: WelcomeViewModelAction)-> WelcomeViewContoller {
        return WelcomeViewContoller.create(action: action)
    }
    
    func makeMainCoordinator(navigaion navigation: UINavigationController)-> MainCoordinator {
        return MainDIContainer().makeMainCoordinator(navigationController: navigation)
    }
    
    func makeJoinViewController()-> JoinViewController {
        return JoinViewController.create()
    }
}
