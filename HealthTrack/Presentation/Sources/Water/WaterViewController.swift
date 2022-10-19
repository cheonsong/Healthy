//
//  WaterViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import DesignSystem

public class WaterViewController: UIViewController {
    
    let waterView = UIView().then {
        $0.backgroundColor = .b2
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(waterView)
        waterView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - Const.padding * 2)
            $0.height.equalTo(60)
            $0.center.equalToSuperview()
        }
    }
}
