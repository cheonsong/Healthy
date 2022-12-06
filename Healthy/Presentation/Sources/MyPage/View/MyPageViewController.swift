//
//  MyPageViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/14.
//

import Foundation
import UIKit
import Util
import RxCocoa
import RxSwift
import Domain
import DesignSystem

public class MyPageViewController: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    
    let dateLabel    = LabelBuilder("HOME_DATE_LABEL".localized([DateModel.today.year, ("MONTH_" + DateModel.today.month).localized, DateModel.today.day])).font(.regular16).textColor(.black).sizeToFit().view
    let welcomeLabel = LabelBuilder("HOME_WELCOME_LABEL".localized(["천송"])).font(.bold25).textColor(.black).sizeToFit().view
    
    let topLine = ViewBuilder().backgrouondColor(UIColor(hex: "#F2F4F5")).view
    
    let stackView = StackViewBuilder().backgrouondColor(.clear).axis(.vertical).distributon(.fillEqually).view
    let editMyInfoView = MyPageView(text: "MYPAGE_EDIT_LABEL".localized)
    let alarmSetView = MyPageView(text: "MYPAGE_ALARM_SET_LABEL".localized)
    let dataResetView = MyPageView(text: "MYPAGE_RESET_LABEL".localized)
    let appVersionView = MyPageView(text: "MYPAGE_APP_VERSION_LABEL".localized)
    //let editMyInfoView = MyPageView(text: "")
    
    public static func create()-> MyPageViewController {
        let vc = MyPageViewController()
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setConstraints()
        bind()
    }
    
    public func addComponents() {
        view.backgroundColor = .white
        appVersionView.isNeedsUpdate(false)
        
        [dateLabel, welcomeLabel, topLine, stackView].forEach { view.addSubview($0) }
        [editMyInfoView, alarmSetView, dataResetView, appVersionView].forEach { stackView.addArrangedSubview($0) }
    }
    
    public func setConstraints() {
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24 + Const.safeAreaTop)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        topLine.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(24)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        stackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(topLine.snp.bottom)
        }
    }
    
    public func bind() {
        App.state.name
            .subscribe(onNext: { [weak self] name in
                self?.welcomeLabel.text = "HOME_WELCOME_LABEL".localized([name])
            })
            .disposed(by: disposeBag)
    }
}
