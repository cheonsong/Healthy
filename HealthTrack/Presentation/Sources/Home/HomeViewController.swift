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

public class HomeViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    
    var disposeBag = DisposeBag()
    
    let dateLabel = Label("2022년 11월 30일")
        .font(.regular10)
        .textColor(.black)
        .view
    
    let welcomeLabel = Label("안녕하세요, 천송님")
        .font(.bold20)
        .textColor(.black)
        .view
    
    let subTitleLabel = Label("건강 정보")
        .font(.bold16)
        .textColor(.black)
        .view
    
    let waterView = MainView(type: .water)
    let stepView = MainView(type: .steps)
    let caloliesView = MainView(type: .calolies)
    let sleepView = MainView(type: .sleep)
    
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
    
    func addComponents() {
        [dateLabel, welcomeLabel, subTitleLabel].forEach { view.addSubview($0) }
        [waterView, stepView, caloliesView, sleepView].forEach { view.addSubview($0) }
    }
    
    func setConstraints() {
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        waterView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        
        stepView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(15)
            $0.right.equalToSuperview().inset(Const.padding)
        }
        
        
        caloliesView.snp.makeConstraints {
            $0.top.equalTo(waterView.snp.bottom).offset(30)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        
        sleepView.snp.makeConstraints {
            $0.top.equalTo(waterView.snp.bottom).offset(30)
            $0.right.equalToSuperview().inset(Const.padding)
        }
    }
    
    func bind() {
        waterView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.coordinator?.presentWaterViewController()
                self?.waterView.isSelected.accept(false)
            })
            .disposed(by: disposeBag)
    }
}
