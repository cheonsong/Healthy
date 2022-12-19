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
    func makeDataInitUsecase()-> InitUserInfoUsecaseProtocol {
        return InitUserInfoUsecase(repository: UserRepository())
    }
    
    // MARK: ViewModel
    func makeMyPageViewModel(action: MyPageViewModelAction)-> MyPageViewModel {
        return MyPageViewModel(action: action,
                               dataInitUsecase: makeDataInitUsecase())
    }
    
    func makeEditViewModel()-> EditViewModel {
        return EditViewModel(validateUsecase: ValidationUseCase(),
                             updateUserInfoUsecase: UpdateUserInfoUsecase(repository: UserRepository()))
    }
    
    func makeCSViewModel()-> CSViewModel {
        return CSViewModel(usecase: SendMessageToSlackUsecase(repository: SlackRepository()))
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
    
    func makeEditViewController() -> EditViewController {
        return EditViewController.create(viewModel: makeEditViewModel())
    }
    
    func makeCSViewController() -> CSViewController {
        return CSViewController.create(viewModel: makeCSViewModel())
    }
}

