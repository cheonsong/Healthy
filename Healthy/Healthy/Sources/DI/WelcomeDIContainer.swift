//
//  WelcomeDIContainer.swift
//  Healthy
//
//  Created by cheonsong on 2022/11/18.
//

import Foundation
import Presentation
import UIKit
import Domain
import Data

final class WelcomeDIContainer {
    init() {}
    
    // MARK: UseCase
    func makeAddUserInfoUsercase()-> AddUserInfoUsecase{
        return AddUserInfoUsecase(repository: UserRepository())
    }
    
    func makeFetchUserInfoUsecase()-> FetchUserInfoUsecase {
        return FetchUserInfoUsecase(repository: UserRepository())
    }
    
    // MARK: ViewModel
    func makeJoinViewModel(action: JoinViewModelAction)-> JoinViewModel {
        return JoinViewModel(validate: ValidationUseCase(),
                             userUsecase: makeAddUserInfoUsercase(),
                             action: action)
    }
    
    func makeWelcomeViewModel(action: WelcomeViewModelAction)-> WelcomeViewModel {
        return WelcomeViewModel(action: action,
                                fetchUserUsecase: makeFetchUserInfoUsecase())
    }
    
    // MARK: Coordinator
    func makeWelcomeCoordinator(navigation: UINavigationController)-> WelcomeCoordinator {
        return WelcomeCoordinator(navigationController: navigation, dependencies: self)
    }
}

extension WelcomeDIContainer: WelcomCoordinatorDependencies {
    
    func makeWelcomeViewController(action: WelcomeViewModelAction)-> WelcomeViewContoller {
        return WelcomeViewContoller.create(viewModel : makeWelcomeViewModel(action: action))
    }
    
    func makeMainCoordinator(navigaion navigation: UINavigationController)-> MainCoordinator {
        return MainDIContainer().makeMainCoordinator(navigationController: navigation)
    }
    
    func makeJoinViewController(action: JoinViewModelAction)-> JoinViewController {
        return JoinViewController.create(viewModel: makeJoinViewModel(action: action))
    }
}
