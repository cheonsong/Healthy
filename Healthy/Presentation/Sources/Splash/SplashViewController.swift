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
        updateCheck()
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
    
    public func updateCheck() {
        let marketingVersion = System().latestVersion()!
        let currentProjectVersion = System.appVersion!
        let splitMarketingVersion = marketingVersion.split(separator: ".").map {$0}
        let splitCurrentProjectVersion = currentProjectVersion.split(separator: ".").map {$0}
        
        // if : 가장 앞자리가 다르면 -> 업데이트 필요
        // 메시지 창 인스턴스 생성, 컨트롤러에 들어갈 버튼 액션 객체 생성 -> 클릭하면 앱스토어로 이동
        // else : 두번째 자리가 달라도 업데이트 필요
        //
        if splitCurrentProjectVersion[0] < splitMarketingVersion[0] {
            let alert = UIAlertController(title: "NOTICE_TEXT".localized, message: "UPDATE_POPUP_CONTENTS".localized([marketingVersion]), preferredStyle: UIAlertController.Style.alert)
            let destructiveAction = UIAlertAction(title: "UPDATE_POPUP_TITLE".localized, style: UIAlertAction.Style.default){(_) in
                System().openAppStore()
            }
            alert.addAction(destructiveAction)
            self.present(alert, animated: false)
        } else {
            if  splitCurrentProjectVersion[1] < splitMarketingVersion[1] {
                let alert = UIAlertController(title: "NOTICE_TEXT".localized, message: "UPDATE_POPUP_CONTENTS".localized([marketingVersion]), preferredStyle: UIAlertController.Style.alert)
                let destructiveAction = UIAlertAction(title: "UPDATE_POPUP_TITLE".localized, style: UIAlertAction.Style.default){(_) in
                    System().openAppStore()
                }
                alert.addAction(destructiveAction)
                self.present(alert, animated: false)
            } else {
                // 이외에는 업데이트 필요 없음
            }
        }
    }
}
