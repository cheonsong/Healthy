//
//  MyPageDIContainer.swift
//  Healthy
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation
import Domain
import Data
import Presentation
import UIKit

final class MyPageDIContainer {
    
    init() {}
    
    // MARK: Usecases
    
    // MARK: ViewModel
    func makeMyPageViewModel(action: MyPageViewModelAction)-> MyPageViewModel {
        return MyPageViewModel(action: action)
    }
    // MARK: Coordinator
    func makeMyPageCoordinator(navigationController: UINavigationController) -> MyPageCoordinator {
        return MyPageCoordinator(navigation: navigationController, dependencies: self)
    }
}

extension MyPageDIContainer: MyPageCoordinatorDependencies {
    func makeMyPageViewController(action: MyPageViewModelAction) -> MyPageViewController {
        return MyPageViewController.create(viewModel: makeMyPageViewModel(action: action))
    }
}

