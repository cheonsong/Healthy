//
//  WaterAddModal.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/21.
//

import Foundation
import UIKit
import DesignSystem
import Util
import RxSwift
import RxCocoa

public class WaterAddModal: ModalView, CodeBaseUI {
    
    // MARK: - View
    let cupImageView = ImageView(PresentationAsset.icoCup.image).view
    
    let plusButton = Button(IcoButton(type: .water, icon: .plus)).view as! IcoButton
    let minusButton = Button(IcoButton(type: .water, icon: .minus)).view as! IcoButton
    
    let buttonStackView = StackView().spacing(30).axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    let addButton = Button(MainButton(.water)).title("추가하기").view as! MainButton
    let cancelButton = Button(MainButton(.water)).title("취소").view as! MainButton
    
    let aCupContainer = View().view
    let aCupOfWaterLabel = Label("물 한잔").textColor(.black).font(.bold16).view
    let aCupUnitLabel = Label("ml").textColor(.black).font(.bold16).view
    lazy var aCupTextForm = TextField(TextForm()).placeholder("한 컵").font(.bold16).delegate(self).view
    
    let countView = View().backgrouondColor(.b2).cornerRadius(15).isHidden(true).view
    let countLabel = Label("x1").textColor(.white).font(.bold16).view
    
    // MARK: - ViewModel
    var viewModel: WaterAddViewModel?
  
    public init(viewModel: WaterAddViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
        print("WaterAddModal Deinit")
    }
    
    public func addComponents() {
        [cupImageView, plusButton, minusButton, buttonStackView, aCupContainer, countView].forEach { modal.addSubview($0) }
        [aCupOfWaterLabel, aCupTextForm, aCupUnitLabel].forEach { aCupContainer.addSubview($0) }
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(addButton)
        countView.addSubview(countLabel)
        
        addButton.configure(false)
    }
    
    public func setConstraints() {
        cupImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(68)
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalTo(cupImageView)
            $0.left.equalTo(cupImageView.snp.right).offset(41)
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalTo(cupImageView)
            $0.right.equalTo(cupImageView.snp.left).offset(-41)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(38)
        }
        
        aCupContainer.snp.makeConstraints {
            $0.top.equalTo(cupImageView.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        aCupOfWaterLabel.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
        }
        
        aCupTextForm.snp.remakeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(25)
            $0.left.equalTo(aCupOfWaterLabel.snp.right).offset(6)
            $0.centerY.equalTo(aCupOfWaterLabel)
        }
        
        aCupUnitLabel.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
            $0.left.equalTo(aCupTextForm.snp.right).offset(6)
        }
        
        
        countView.snp.makeConstraints {
            $0.top.equalTo(cupImageView.snp.top).offset(-15)
            $0.right.equalTo(cupImageView.snp.right).offset(15)
            $0.size.equalTo(30)
        }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        addButton.snp.removeConstraints()
        cancelButton.snp.removeConstraints()
        
    }
    
    public func bind() {
        // MARK: Input
        cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss()
            })
            .disposed(by: disposeBag)
        
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel?.didPlus()
            })
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel?.didMinus()
            })
            .disposed(by: disposeBag)
        
        addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel?.didAddWater(Int(self?.aCupTextForm.text ?? "0") ?? 0)
                self?.dismiss()
            })
            .disposed(by: disposeBag)
        
        aCupTextForm.rx.text.orEmpty
            .subscribe(onNext: { [weak self] text in
                self?.viewModel?.validateText(text)
            })
            .disposed(by: disposeBag)
        
        // MARK: Output
        viewModel?.isAddButtonActive
            .subscribe(onNext: addButton.configure)
            .disposed(by: disposeBag)
        
        viewModel?.isCountHidden
            .bind(to: countView.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel?.waterCount
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.validatedText
            .bind(to: aCupTextForm.rx.text)
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}

extension WaterAddModal: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.b2.cgColor
        textField.layer.borderWidth = 2
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gr2.cgColor
        textField.layer.borderWidth = 1
    }
}
