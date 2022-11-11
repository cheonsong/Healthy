//
//  SplashViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import UIKit
import Util

public class SplashViewController: UIViewController, CodeBaseUI {
    
    let image = ImageView(PresentationAsset.splash.image)
        .frame(CGRect(x: UIScreen.main.bounds.width/2 - 54, y: 50, width: 106, height: 140))
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
        
        animator = UIDynamicAnimator(referenceView: self.view)
        let behaviors = UIDynamicBehavior()
        // 중력 설정
        let gravity = UIGravityBehavior(items: [image])
        let vector = CGVector(dx: 0.0, dy: 1.0)
        gravity.gravityDirection = vector
        
        let collision = UICollisionBehavior(items: [image])
        collision.addBoundary(withIdentifier: NSString(string: "hello"), from: CGPoint(x: 0, y: UIScreen.main.bounds.height/2+70), to: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height/2 + 70))
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionMode = .boundaries
        
        let behavior = UIDynamicItemBehavior(items: [image])
        behavior.elasticity = 0.5
        
        behaviors.addChildBehavior(gravity)
        behaviors.addChildBehavior(collision)
        behaviors.addChildBehavior(behavior)
        
        animator?.addBehavior(behaviors)
    }
    
    public func addComponents() {
        view.addSubview(image)
        self.view.backgroundColor = .white
    }
    
    public func setConstraints() {
        
    }
    
    public func bind() {
        
    }
}
