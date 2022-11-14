//
//  WaterSetModal.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import DesignSystem
import Util
import UIKit
import RxKeyboard
import RxSwift
import RxCocoa

enum WaterUnit {
    case oz
    case l
}

public class WaterSetModal: ModalView, CodeBaseUI {
    
    var unitButtonObservable = BehaviorRelay<WaterUnit>(value: .l)
    
    let title = LabelBuilder("현재 하루 목표\n2 L")
        .font(.bold20)
        .textColor(.black)
        .textAlignment(.center)
        .numberOfLines(0)
        .attributedTextChangeColor("현재 하루 목표\n2 L", .b2, ["2 L"])
        .view
    
    let ozButton = ButtonBuilder()
        .title("Oz")
        .font(.bold20)
        .borderColor(.gr2)
        .cornerRadius(10)
        .view
    
    let lButton = ButtonBuilder()
        .title("L")
        .font(.bold20)
        .borderColor(.gr2)
        .cornerRadius(10)
        .view
    
    lazy var aCupTextForm = TextFieldBuilder(TextForm()).placeholder("물 한잔의 양을 입력하세요").delegate(self).view
    
    lazy var goalTextForm = TextFieldBuilder(TextForm()).placeholder("목표량을 입력하세요").delegate(self).view
    
    let buttonStackView = StackViewBuilder().spacing(30).axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    let completeButton = ButtonBuilder(MainButton(.water)).title("완료").view as! MainButton
    let cancelButton = ButtonBuilder(MainButton(.water)).title("취소").view as! MainButton
    
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
        [title, ozButton, lButton, aCupTextForm, goalTextForm, buttonStackView].forEach { modal.addSubview($0) }
        [cancelButton, completeButton].forEach { buttonStackView.addArrangedSubview($0) }
        
        completeButton.configure(false)
        
        let newPosition = aCupTextForm.endOfDocument
        aCupTextForm.selectedTextRange = aCupTextForm.textRange(from: newPosition, to: newPosition)
    }
    
    public func setConstraints() {
        modal.snp.updateConstraints { make in
            make.height.equalTo(Const.modalHeightLong)
        }
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        ozButton.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().inset(Const.padding)
            $0.height.equalTo(39)
            $0.width.equalTo(cancelButton)
        }
        
        lButton.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.right.equalToSuperview().inset(Const.padding)
            $0.height.equalTo(39)
            $0.width.equalTo(cancelButton)
        }
        
        aCupTextForm.snp.makeConstraints {
            $0.top.equalTo(ozButton.snp.bottom).offset(25)
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        goalTextForm.snp.makeConstraints {
            $0.top.equalTo(aCupTextForm.snp.bottom).offset(25)
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(goalTextForm.snp.bottom).offset(25)
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(38)
        }
        
        completeButton.snp.removeConstraints()
        cancelButton.snp.removeConstraints()
        
    }
    
    public func bind() {
        
        unitButtonObservable
            .subscribe(onNext: { [weak self] unit in
                guard let self = self else { return }
                switch unit {
                case .oz:
                    self.ozButton.titleColor = .white
                    self.ozButton.layer.borderWidth = 0
                    self.ozButton.backgroundColor = .b2
                    self.lButton.titleColor = .black
                    self.lButton.layer.borderWidth = 1
                    self.lButton.backgroundColor = .white
                case .l:
                    self.ozButton.titleColor = .black
                    self.ozButton.layer.borderWidth = 1
                    self.ozButton.backgroundColor = .white
                    self.lButton.titleColor = .white
                    self.lButton.layer.borderWidth = 0
                    self.lButton.backgroundColor = .b2
                }
            })
            .disposed(by: disposeBag)
        
        ozButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.unitButtonObservable.accept(.oz)
            })
            .disposed(by: disposeBag)
        
        lButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.unitButtonObservable.accept(.l)
            })
            .disposed(by: disposeBag)
        
        cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.dismiss()
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}

extension WaterSetModal: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.b2.cgColor
        textField.layer.borderWidth = 2
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gr2.cgColor
        textField.layer.borderWidth = 1
    }
}
