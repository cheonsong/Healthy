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
    
    let dateLabel = Label("2022년 11월 30일")
        .font(.regular16)
        .textColor(.black)
        .sizeToFit()
        .view
    
    let welcomeLabel = Label("안녕하세요, 천송님")
        .font(.bold25)
        .textColor(.black)
        .sizeToFit()
        .view
    
    let scrollView    = ScrollView().backgrouondColor(.clear).showsVerticalScrollIndicator(false).view
    let stackView     = StackView().axis(.vertical).spacing(30).view
    
    let waterTitle    = Label("WATER").font(.bold16).textColor(.black).sizeToFit().view
    let stepsTitle    = Label("STEPS").font(.bold16).textColor(.black).sizeToFit().view
    let caloriesTitle = Label("CALORIES").font(.bold16).textColor(.black).sizeToFit().view
    let sleepTitle    = Label("SLEEP").font(.bold16).textColor(.black).sizeToFit().view
    
    let waterView     = MainView(type: .water)
    let stepView      = MainView(type: .steps)
    let caloliesView  = MainView(type: .calolies)
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
    
    public func addComponents() {
        [dateLabel, welcomeLabel, scrollView].forEach { view.addSubview($0) }
        scrollView.addSubview(stackView)
        [waterTitle, waterView, stepsTitle, stepView, caloriesTitle, caloliesView, sleepTitle, sleepView, View().backgrouondColor(.clear).view].forEach { stackView.addArrangedSubview($0) }
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
        
        stackView.setCustomSpacing(10, after: waterTitle)
        stackView.setCustomSpacing(10, after: stepsTitle)
        stackView.setCustomSpacing(10, after: caloriesTitle)
        stackView.setCustomSpacing(10, after: sleepTitle)
    }
    
    public func bind() {
        waterView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.coordinator?.presentWaterViewController()
            })
            .disposed(by: disposeBag)
        
        stepView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.coordinator?.presentStepsViewController()
            })
            .disposed(by: disposeBag)
    }
}
