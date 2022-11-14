//
//  StepsSetModal.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/31.
//

import Foundation
import DesignSystem
import Util
import UIKit
import RxKeyboard
import RxSwift
import RxCocoa

public class StepsSetModal: ModalView, CodeBaseUI {
    
    let title = LabelBuilder("현재 하루 목표\n2 L")
        .font(.bold20)
        .textColor(.black)
        .textAlignment(.center)
        .numberOfLines(0)
        .attributedTextChangeColor("현재 하루 목표\n10000 걸음", .b2, ["10000 걸음"])
        .view
    
    lazy var goalTextForm = TextFieldBuilder(TextForm()).placeholder("목표량을 입력하세요").delegate(self).view
    
    let healthSyncContainer = ViewBuilder().backgrouondColor(.clear).view
    let healthSyncIcon = ImageViewBuilder(PresentationAsset.icoHealthApp.image).view
    let healthSyncLabel = LabelBuilder("건강 데이터 연동").font(.bold16).textColor(.black).view
    let healthSyncSwitch = UISwitch().then {
        $0.onTintColor = .b2
    }
    
    let buttonStackView = StackViewBuilder().spacing(30).axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    let completeButton = ButtonBuilder(MainButton(.steps)).title("완료").view as! MainButton
    let cancelButton = ButtonBuilder(MainButton(.steps)).title("취소").view as! MainButton
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func addComponents() {
        [title, goalTextForm, healthSyncContainer, buttonStackView].forEach { modal.addSubview($0) }
        [healthSyncIcon, healthSyncLabel, healthSyncSwitch].forEach { healthSyncContainer.addSubview($0) }
        [cancelButton, completeButton].forEach { buttonStackView.addArrangedSubview($0) }
        
        completeButton.configure(false)
    }
    
    public func setConstraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        goalTextForm.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(25)
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        healthSyncContainer.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(goalTextForm.snp.bottom).offset(28)
        }
        
        healthSyncIcon.snp.makeConstraints {
            $0.size.equalTo(43)
            $0.left.top.bottom.equalToSuperview()
        }
        
        healthSyncLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(healthSyncIcon.snp.right).offset(11)
        }
        
        healthSyncSwitch.snp.makeConstraints {
            $0.centerY.right.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(38)
        }
        
        completeButton.snp.removeConstraints()
        cancelButton.snp.removeConstraints()
        
    }
    
    public func bind() {
        RxKeyboard.instance.visibleHeight
                 .drive(onNext: { [weak self] keyboardHeight in
                     guard let self = self else { return }
                     if keyboardHeight > 0 {
                         self.modal.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight + Const.safeAreaBottom)
                         self.background.isUserInteractionEnabled = false
                     } else {
                         self.modal.transform = .identity
                         self.background.isUserInteractionEnabled = true
                     }
                 })
                 .disposed(by: disposeBag)
        
        cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss()
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}

extension StepsSetModal: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.b2.cgColor
        textField.layer.borderWidth = 2
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gr2.cgColor
        textField.layer.borderWidth = 1
    }
}

