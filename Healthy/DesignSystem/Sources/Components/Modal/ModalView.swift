//
//  ModalView.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/21.
//

import UIKit
import Util
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture
import RxKeyboard

open class ModalView: UIView {
    
    public let background = ViewBuilder().backgrouondColor(.dim).view
    
    public let modal = ViewBuilder().backgrouondColor(.gr3).view
    
    public var disposeBag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        modal.roundCorners([.topLeft, .topRight], radius: 50)
    }
    
    func addComponents() {
        self.addSubview(background)
        self.addSubview(modal)
    }
    
    func setConstraints() {
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        modal.snp.makeConstraints {
            $0.height.equalTo(Const.modalHeight)
            $0.width.equalTo(Const.modalWidth)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    func bind() {
        background.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.dismiss()
            })
            .disposed(by: disposeBag)
        
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
    }
    
    public func present(target: UIView, isLong: Bool = false) {
        target.addSubview(self)
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        modal.transform = CGAffineTransform(translationX: 0, y: isLong ? Const.modalHeightLong : Const.modalHeight)
        UIView.animate(withDuration: 0.35, animations: {
            self.modal.transform = .identity
        }) 
    }
    
    public func dismiss() {
        UIView.animate(withDuration: 0.35, animations: {
            self.modal.transform = CGAffineTransform(translationX: 0, y: self.modal.frame.height)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}
