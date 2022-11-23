//
//  WelcomeViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/18.
//

import Foundation
import UIKit
import Then
import SnapKit
import Util
import DesignSystem
import RxSwift
import RxCocoa

public class WelcomeViewContoller: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    var action: WelcomeViewModelAction!
    var viewModel: WelcomeViewModel!
    
    let mainTitleLabel = LabelBuilder("WELCOME_MAIN_LABEL".localized)
        .font(DesignSystemFontFamily.Suit.semiBold.font(size: 40))
        .textColor(.gr1)
        .textAlignment(.left)
        .attributedTextChangeColor("WELCOME_MAIN_LABEL".localized, .b2, Const.welcomeMainTitleStrings)
        .numberOfLines(0)
        .view
    
    let subTitleLabel = LabelBuilder("WELCOME_SUB_LABEL".localized)
        .font(.regular16)
        .textColor(.gr1)
        .view
    
    let startButton = ButtonBuilder(MainButton()).title("WELCOME_START_BUTTON".localized).view as! MainButton
    
    public static func create(viewModel: WelcomeViewModel)-> WelcomeViewContoller {
        let vc = WelcomeViewContoller()
        vc.viewModel = viewModel
        return vc
    }
    
    public override func viewDidLoad() {
        addComponents()
        setConstraints()
        bind()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad()
    }
    
    public func addComponents() {
        view.backgroundColor = .white
        [mainTitleLabel, subTitleLabel, startButton].forEach { view.addSubview($0) }
    }
    
    public func setConstraints() {
        mainTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(Const.padding)
            $0.top.equalToSuperview().inset(Const.safeAreaTop + 88)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(Const.padding)
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(16)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func bind() {
        startButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.startButtonTapped()
            })
            .disposed(by: disposeBag)
    }
}
