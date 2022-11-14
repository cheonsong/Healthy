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
import DesignSystem

// MainDIContainer 에서 구현
public protocol MainCoordinatorDependencies {
    func makeHomeCoordinator(navigationController: UINavigationController)-> HomeCoordinator
    func makeMyPageCoordinator(navigationController: UINavigationController)-> MyPageCoordinator
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
        let home = getNavigation()
        let homeCoordinator = dependencies.makeHomeCoordinator(navigationController: home)
        
        let my = getNavigation()
        let myCoordinator = dependencies.makeMyPageCoordinator(navigationController: my)
        
        let fontAttributes = [NSAttributedString.Key.font: DesignSystemFontFamily.Suit.bold.font(size: 12)]
        
        home.tabBarItem = UITabBarItem(title: "Home", image: PresentationAsset.icoHomeOff.image, tag: 0)
        home.tabBarItem.selectedImage = PresentationAsset.icoHomeOn.image
        home.tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
        home.tabBarItem.setTitleTextAttributes(fontAttributes, for: .selected)
        
        my.tabBarItem = UITabBarItem(title: "My", image: PresentationAsset.icoMyOff.image, tag: 0)
        my.tabBarItem.selectedImage = PresentationAsset.icoMyOn.image
        my.tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
        my.tabBarItem.setTitleTextAttributes(fontAttributes, for: .selected)
        
        childCoordinators = [homeCoordinator, myCoordinator]
        
        coordinator.tabBar.tintColor = .b2
        coordinator.tabBar.unselectedItemTintColor = UIColor(hex: "#A4A6AA")
        
        coordinator.viewControllers = [home, my]
        coordinator.modalPresentationStyle = .fullScreen
        coordinator.selectedIndex          = 0
        
        homeCoordinator.start()
        myCoordinator.start()
    }
}
