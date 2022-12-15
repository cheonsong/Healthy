//
//  GuideViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/15.
//

import Foundation
import UIKit
import Util
import RxSwift
import SnapKit
import RxCocoa
import DesignSystem

public class GuideViewController: UIViewController, CodeBaseUI {

    var disposeBag = DisposeBag()
    var guideState = BehaviorRelay<Int>(value: 1)
    
    let dot1 = ViewBuilder().backgrouondColor(.black).cornerRadius(5).view
    let dot2 = ViewBuilder().backgrouondColor(.black).cornerRadius(5).view
    let dot3 = ViewBuilder().backgrouondColor(.black).cornerRadius(5).view
    
    let guide1Container = ViewBuilder().view
    let guide2Container = ViewBuilder().isHidden(true).view
    let guide3Container = ViewBuilder().isHidden(true).view
    
    let guide1Image = ImageViewBuilder(PresentationAsset.guide1.image).view
    let guide2Image = ImageViewBuilder(PresentationAsset.guide2.image).view
    let guide3Image = ImageViewBuilder(PresentationAsset.guide3.image).view
    
    let guide1TitleLabel = LabelBuilder("GUIDE_1_TITLE_LABEL".localized).font(.bold20).textColor(.black).sizeToFit().view
    let guide2TitleLabel = LabelBuilder("GUIDE_2_TITLE_LABEL".localized).font(.bold20).textColor(.black).sizeToFit().view
    let guide3TitleLabel = LabelBuilder("GUIDE_3_TITLE_LABEL".localized).font(.bold20).textColor(.black).sizeToFit().view
    
    let guide1SubLabel = LabelBuilder("GUIDE_1_SUB_LABEL".localized).textAlignment(.center).numberOfLines(0).font(.regular16).textColor(.black).sizeToFit().view
    let guide2SubLabel = LabelBuilder("GUIDE_2_SUB_LABEL".localized).textAlignment(.center).numberOfLines(0).font(.regular16).textColor(.black).sizeToFit().view
    let guide3SubLabel = LabelBuilder("GUIDE_3_SUB_LABEL".localized).textAlignment(.center).numberOfLines(0).font(.regular16).textColor(.black).sizeToFit().view
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addComponents()
        setConstraints()
        bind()
    }
    
    public func addComponents() {
        [dot1, dot2, dot3].forEach { view.addSubview($0) }
        [guide1Container, guide2Container, guide3Container].forEach { view.addSubview($0) }
        [guide1TitleLabel, guide1SubLabel, guide1Image].forEach { guide1Container.addSubview($0) }
        [guide2TitleLabel, guide2SubLabel, guide2Image].forEach { guide2Container.addSubview($0) }
        [guide3TitleLabel, guide3SubLabel, guide3Image].forEach { guide3Container.addSubview($0) }
    }
    
    public func setConstraints() {
        let height: CGFloat = UIScreen.main.bounds.height - (guide1TitleLabel.frame.height + guide1SubLabel.frame.height + 110 + Const.safeAreaTop + 10)
        print(height)
        dot1.snp.makeConstraints {
            $0.centerY.equalTo(dot2)
            $0.size.equalTo(10)
            $0.right.equalTo(dot2.snp.left).offset(-10)
        }
        
        dot3.snp.makeConstraints {
            $0.centerY.equalTo(dot2)
            $0.size.equalTo(10)
            $0.left.equalTo(dot2.snp.right).offset(10)
        }
        
        dot2.snp.makeConstraints {
            $0.size.equalTo(10)
            $0.top.equalToSuperview().inset(25)
            $0.centerX.equalToSuperview()
        }
        
        [guide1Container, guide2Container, guide3Container].forEach { container in
            container.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        [guide1TitleLabel, guide2TitleLabel, guide3TitleLabel].forEach { title in
            title.snp.makeConstraints {
                $0.top.equalToSuperview().inset(50)
                $0.centerX.equalToSuperview()
            }
        }
        
        [guide1SubLabel, guide2SubLabel, guide3SubLabel].forEach { sub in
            sub.snp.makeConstraints {
                $0.top.equalTo(guide1TitleLabel.snp.bottom).offset(10)
                $0.centerX.equalToSuperview()
            }
        }
        
        [guide1Image, guide2Image, guide3Image].forEach { image in
            image.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.bottom.equalToSuperview().inset(25)
                $0.height.equalTo(height)
            }
        }
    }
    
    public func bind() {
        view.rx.swipeGesture(.left)
            .when(.recognized)
            .subscribe(onNext: { [weak self] gesture in
                guard let self = self else { return }
                let value = min(self.guideState.value + 1, 3)
                self.guideState.accept(value)
            })
            .disposed(by: disposeBag)
        
        view.rx.swipeGesture(.right)
            .when(.recognized)
            .subscribe(onNext: { [weak self] gesture in
                guard let self = self else { return }
                let value = max(self.guideState.value - 1, 1)
                self.guideState.accept(value)
            })
            .disposed(by: disposeBag)
        
        guideState
            .subscribe(onNext: { [weak self] state in
                switch state {
                case 1:
                    self?.dot1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    self?.dot2.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.dot3.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.guide1Container.isHidden = false
                    self?.guide2Container.isHidden = true
                    self?.guide3Container.isHidden = true
                case 2:
                    self?.dot1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.dot2.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    self?.dot3.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.guide1Container.isHidden = true
                    self?.guide2Container.isHidden = false
                    self?.guide3Container.isHidden = true
                case 3:
                    self?.dot1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.dot2.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    self?.dot3.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    self?.guide1Container.isHidden = true
                    self?.guide2Container.isHidden = true
                    self?.guide3Container.isHidden = false
                    
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }

}
