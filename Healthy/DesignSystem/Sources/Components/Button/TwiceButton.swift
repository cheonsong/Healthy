//
//  TwiceButton.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/11/21.
//

import Foundation
import Util
import SnapKit
import UIKit
import RxCocoa
import RxSwift

public enum TwiceButtonCase {
    case none
    case left
    case right
}

public class TwiceButton: UIView, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    public var selectedButton: BehaviorRelay<TwiceButtonCase> = .init(value: .none)
    
    public var selectedButtonTitle: String {
        switch selectedButton.value {
        case .left:
            return leftButton.title
        case .right:
            return rightButton.title
        default:
            return ""
        }
    }
    
    private let leftButton = ButtonBuilder()
        .font(.regular20)
        .titleColor(.white)
        .backgroundColor(.gr2)
        .borderColor(.gr2)
        .borderWidth(1)
        .cornerRadius(10)
        .view
    
    private let rightButton = ButtonBuilder()
        .font(.regular20)
        .titleColor(.white)
        .backgroundColor(.gr2)
        .borderColor(.gr2)
        .borderWidth(1)
        .cornerRadius(10)
        .view
    
    let buttonStackView = StackViewBuilder().spacing(30).axis(.horizontal).distributon(.fillEqually).backgrouondColor(.clear).view
    
    public convenience init(left: String, right: String) {
        self.init()
        leftButton.title = left
        rightButton.title = right
    }
    
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
        self.layer.masksToBounds = true
        self.buttonStackView.layer.masksToBounds = true
        
        self.addSubview(buttonStackView)
        
        [leftButton, rightButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
    }
    
    public func setConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(39)
            $0.width.equalTo(Const.fullWidth)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    public func bind() {
        leftButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.selectedButton.accept(.left)
            })
            .disposed(by: disposeBag)
        
        rightButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.selectedButton.accept(.right)
            })
            .disposed(by: disposeBag)
        
        selectedButton
            .subscribe(onNext: { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .left:
                    self.leftButton.titleColor = .white
                    self.leftButton.layer.borderWidth = 0
                    self.leftButton.backgroundColor = .b2
                    self.rightButton.titleColor = .gr2
                    self.rightButton.layer.borderWidth = 1
                    self.rightButton.backgroundColor = .white
                case .right:
                    self.leftButton.titleColor = .gr2
                    self.leftButton.layer.borderWidth = 1
                    self.leftButton.backgroundColor = .white
                    self.rightButton.titleColor = .white
                    self.rightButton.layer.borderWidth = 0
                    self.rightButton.backgroundColor = .b2
                default:
                    self.leftButton.titleColor = .gr2
                    self.leftButton.layer.borderWidth = 1
                    self.leftButton.backgroundColor = .white
                    self.rightButton.titleColor = .gr2
                    self.rightButton.layer.borderWidth = 1
                    self.rightButton.backgroundColor = .white
                }
            })
            .disposed(by: disposeBag)
    }
}
