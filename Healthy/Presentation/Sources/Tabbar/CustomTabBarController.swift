//
//  CustomTabBarController.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit

public class CustomTabBarController: UITabBarController {
    
//    weak var coordinator: MainCoordinating?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
}

extension CALayer {
    // Sketch 스타일의 그림자를 생성하는 유틸리티 함수
    public func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있다.
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
