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
    
    var viewModel: WaterSetViewModel!
    
    var unitButtonObservable = BehaviorRelay<WaterUnit>(value: .l)
    
    let title = LabelBuilder("WATER_SET_TITLE_LABEL".localized)
        .font(.bold20)
        .textColor(.black)
        .textAlignment(.center)
        .numberOfLines(0)
        .view
    
    let goalLabel = LabelBuilder("2L")
        .font(.bold20)
        .textColor(.b2)
        .textAlignment(.center)
        .numberOfLines(0)
        .view
    
    let ozButton = ButtonBuilder()
        .title("Oz")
        .font(.bold20)
        .titleColor(.white)
        .backgroundColor(.gr2)
        .borderColor(.gr2)
        .cornerRadius(10)
        .view
    
    let lButton = ButtonBuilder()
        .title("L")
        .font(.bold20)
        .borderColor(.gr2)
        .cornerRadius(10)
        .view
    
    lazy var goalTextForm = TextFieldBuilder(TextForm()).placeholder("WATER_SET_GOAL_TEXTFORM".localized).view
    
    let buttonStackView = StackViewBuilder().spacing(30).axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    let completeButton = ButtonBuilder(MainButton()).title("COMPLETE_BUTTON".localized).view as! MainButton
    let cancelButton = ButtonBuilder(CancelButton()).title("CANCEL_BUTTON".localized).view as! CancelButton
    
    public init(viewModel: WaterSetViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func addComponents() {
        [title, goalLabel, ozButton, lButton, goalTextForm, buttonStackView].forEach { modal.addSubview($0) }
        [cancelButton, completeButton].forEach { buttonStackView.addArrangedSubview($0) }
        
        completeButton.configure(false)
        
        let newPosition = goalTextForm.endOfDocument
        goalTextForm.selectedTextRange = goalTextForm.textRange(from: newPosition, to: newPosition)
    }
    
    public func setConstraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        goalLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        ozButton.snp.makeConstraints {
            $0.top.equalTo(goalLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().inset(Const.padding)
            $0.height.equalTo(39)
            $0.width.equalTo(cancelButton)
        }
        
        lButton.snp.makeConstraints {
            $0.top.equalTo(goalLabel.snp.bottom).offset(24)
            $0.right.equalToSuperview().inset(Const.padding)
            $0.height.equalTo(39)
            $0.width.equalTo(cancelButton)
        }
        
        goalTextForm.snp.makeConstraints {
            $0.top.equalTo(ozButton.snp.bottom).offset(30)
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
//            $0.top.equalTo(goalTextForm.snp.bottom).offset(25)
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
                    self.ozButton.titleColor = .white
                    self.ozButton.layer.borderWidth = 1
                    self.ozButton.backgroundColor = .gr2
                    self.lButton.titleColor = .white
                    self.lButton.layer.borderWidth = 0
                    self.lButton.backgroundColor = .b2
                }
            })
            .disposed(by: disposeBag)
        
        ozButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                // TODO: ToastMessage
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
        
        goalTextForm.rx.text.orEmpty
            .subscribe(onNext: { [weak self] text in
                self?.viewModel.goalTextFormInput(text: text)
            })
            .disposed(by: disposeBag)
        
        viewModel.validatedText
            .bind(to: goalTextForm.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.isCompleteButtonActive
            .bind(to: completeButton.rx.isActive)
            .disposed(by: disposeBag)
        
        completeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.completeButtonTapped()
                self?.dismiss()
            })
            .disposed(by: disposeBag)
        
        App.state.waterGoal
            .subscribe(onNext: { [weak self] value in
                var text = ""
            
                if value.hasDecimalNumber {
                    text = value.secondDecimal
                } else {
                    text = String(Int(value))
                }
                
                self?.goalLabel.text = text + "L"
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}
