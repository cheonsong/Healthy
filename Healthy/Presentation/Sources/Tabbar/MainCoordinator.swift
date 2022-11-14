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

public class MainCoordinator: NSObject, CoordinatorType {
    public var childCoordinators: [CoordinatorType] = []
    
    public var navigationController : UINavigationController
    private var transition: UIViewControllerAnimatedTransitioning?
    
    private let dependencies: MainCoordinatorDependencies
    
    var disposeBag: DisposeBag = .init()
    
    public init(navigationController: UINavigationController,
                dependencies: MainCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        super.init()
        self.navigationController.delegate = self
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
        let tabbarController = CustomTabBarController()
        
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
        
        tabbarController.tabBar.tintColor = .b2
        tabbarController.tabBar.unselectedItemTintColor = UIColor(hex: "#A4A6AA")
        
        tabbarController.viewControllers = [home, my]
        tabbarController.modalPresentationStyle = .fullScreen
        tabbarController.selectedIndex          = 0
        
        homeCoordinator.start()
        myCoordinator.start()
        
        self.transition =  FadeAnimator(animationDuration: 0.5, isPresenting: false)
        navigationController.setViewControllers([tabbarController], animated: true)
        self.transition = nil
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
}

