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
    
    let image = ImageViewBuilder(PresentationAsset.healthy.image)
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
        
        image.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, animations: {
            self.image.transform = .identity
        })
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
