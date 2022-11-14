//
//  MainViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit
import DesignSystem
import Util
import RxSwift
import RxCocoa
import RxGesture

public class HomeViewController: UIViewController, CodeBaseUI {
    
    var coordinator: HomeCoordinator?
    
    var disposeBag = DisposeBag()
    
    let dateLabel = LabelBuilder("2022년 11월 30일")
        .font(.regular16)
        .textColor(.black)
        .sizeToFit()
        .view
    
    let welcomeLabel = LabelBuilder("안녕하세요, 천송님")
        .font(.bold25)
        .textColor(.black)
        .sizeToFit()
        .view
    
    let scrollView    = ScrollViewBuilder().backgrouondColor(.clear).showsVerticalScrollIndicator(false).view
    let stackView     = StackViewBuilder().axis(.vertical).spacing(30).view
    
    let waterContainer    = ViewBuilder().view
    let stepsContainer    = ViewBuilder().view
    let caloriesContainer = ViewBuilder().view
    let sleepContainer    = ViewBuilder().view
    
    let waterTitle    = LabelBuilder("WATER").font(.bold16).textColor(.black).sizeToFit().view
    let stepsTitle    = LabelBuilder("STEPS").font(.bold16).textColor(.black).sizeToFit().view
    let caloriesTitle = LabelBuilder("CALORIES").font(.bold16).textColor(.black).sizeToFit().view
    let sleepTitle    = LabelBuilder("SLEEP").font(.bold16).textColor(.black).sizeToFit().view
    
    let waterView     = MainView(type: .water)
    let stepView      = MainView(type: .steps)
    let caloriesView  = MainView(type: .calolies)
    let sleepView     = MainView(type: .sleep)
    
    /// MainViewController DI를 위한 Create 함수
    public static func create()-> HomeViewController {
        let vc = HomeViewController()
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addComponents()
        setConstraints()
        bind()
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoadAnimation()
    }
    
    public func addComponents() {
        [dateLabel, welcomeLabel, scrollView].forEach { view.addSubview($0) }
        scrollView.addSubview(stackView)
        [waterTitle, waterView].forEach { waterContainer.addSubview($0) }
        [stepsTitle, stepView].forEach { stepsContainer.addSubview($0) }
        [caloriesTitle, caloriesView].forEach { caloriesContainer.addSubview($0) }
        [sleepTitle, sleepView].forEach { sleepContainer.addSubview($0) }
        
        [waterContainer, stepsContainer, caloriesContainer, sleepContainer, ViewBuilder().backgrouondColor(.clear).view].forEach { stackView.addArrangedSubview($0) }
    }
    
    public func setConstraints() {
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        waterTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        waterView.snp.makeConstraints {
            $0.top.equalTo(waterTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        sleepTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        sleepView.snp.makeConstraints {
            $0.top.equalTo(sleepTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        stepsTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        stepView.snp.makeConstraints {
            $0.top.equalTo(stepsTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        caloriesTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        caloriesView.snp.makeConstraints {
            $0.top.equalTo(caloriesTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
    }
    
    public func bind() {
        waterView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.coordinator?.presentWaterViewController()
            })
            .disposed(by: disposeBag)
        
//        stepView.rx.tapGesture()
//            .when(.recognized)
//            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [weak self] _ in
//                self?.coordinator?.presentStepsViewController()
//            })
//            .disposed(by: disposeBag)
    }
    
    private func viewDidLoadAnimation() {
        self.stepsContainer.transform = CGAffineTransform(translationX: 0, y: -200)
        self.stepsContainer.alpha = 0
        self.caloriesContainer.transform = CGAffineTransform(translationX: 0, y: -200)
        self.caloriesContainer.alpha = 0
        self.sleepContainer.transform = CGAffineTransform(translationX: 0, y: -200)
        self.sleepContainer.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.stepsContainer.transform = .identity
            self.stepsContainer.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.caloriesContainer.transform = .identity
                self.caloriesContainer.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.sleepContainer.transform = .identity
                    self.sleepContainer.alpha = 1
                })
            })
        })
    }
}
