//
//  SplashViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import UIKit
import Util
import SnapKit

public class SplashViewController: UIViewController, CodeBaseUI, UIViewControllerTransitioningDelegate {
    
    let image = ImageViewBuilder(PresentationAsset.healty.image)
        .view
    
    var animator: UIDynamicAnimator?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addComponents()
        setConstraints()
        bind()
    }
    
    public func addComponents() {
        view.addSubview(image)
        self.view.backgroundColor = .b2
        image.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    public func setConstraints() {
        
    }
    
    public func bind() {
        
    }
}