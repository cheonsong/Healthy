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

public class WaterAddModal: ModalView, CodeBaseUI {
    
    let cupImageView = ImageView(PresentationAsset.icoCup.image).view
    
    let plusButton = Button(IcoButton(type: .water, icon: .plus)).view as! IcoButton
    let minusButton = Button(IcoButton(type: .water, icon: .minus)).view as! IcoButton
    
    let buttonStackView = StackView().spacing(30).axis(.horizontal).backgrouondColor(.clear).distributon(.fillEqually).view
    let addButton = Button(MainButton(.water)).title("추가하기").view as! MainButton
    let cancelButton = Button(MainButton(.water)).title("취소").view as! MainButton
    
    let countLabel = Label("물 한잔 200 ml").textColor(.black).font(.bold16).view
    
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
        [cupImageView, plusButton, minusButton, buttonStackView, countLabel].forEach { modal.addSubview($0) }
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(addButton)
        
        minusButton.configure(false)
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
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(cupImageView.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        addButton.snp.removeConstraints()
        cancelButton.snp.removeConstraints()
        
    }
    
    public func bind() {
        cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss()
            })
            .disposed(by: disposeBag)
    }
}
