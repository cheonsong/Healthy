//
//  MainCoordinator.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture
import Util

// MainDIContainer 에서 구현
public protocol MainCoordinatorDependencies {
    func makeHomeCoordinator(navigationController: UINavigationController)-> HomeCoordinator
}

public class MainCoordinator: CoordinatorType {
    public var childCoordinators: [CoordinatorType] = []
    
    public var coordinator : CustomTabBarController
    
    private let dependencies: MainCoordinatorDependencies
    
    var disposeBag: DisposeBag = .init()
    
    public init(coordinator: CustomTabBarController,
                dependencies: MainCoordinatorDependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
    
    public func start(){
        // 인디케이터 부터..
        serviceInit()
    }
    
    /**
     네비게이션컨트롤러를 생성한다
     - Parameters: -
     - Returns: UINavigationController
     */
    func getNavigation() -> UINavigationController{
        let navigation = UINavigationController()
            navigation.setToolbarHidden(true, animated: false)
            navigation.setNavigationBarHidden(true, animated: false)
        return navigation
    }
    
    func serviceInit() {
        // 인디케이터 끝나고
        let vc1 = getNavigation()
        
        let homeCoordinator = dependencies.makeHomeCoordinator(navigationController: vc1)
        
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "home"), selectedImage: UIImage(systemName: "home"))
        
        
        childCoordinators = [homeCoordinator]
        
        coordinator.viewControllers = [vc1]
        coordinator.modalPresentationStyle = .fullScreen
        coordinator.selectedIndex          = 1
        
        homeCoordinator.start()
    }
}
