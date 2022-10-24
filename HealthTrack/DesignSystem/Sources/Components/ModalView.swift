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

open class ModalView: UIView {
    
    private let background = View().backgrouondColor(.dim).view
    
    private let modalShadowView = View().backgrouondColor(.clear).view
    
    public let modal = View().backgrouondColor(.gr3).view
    
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
        
        modalShadowView.layer.shadowColor = UIColor.black.cgColor
        modalShadowView.layer.shadowOffset = CGSize(width: 0, height: -4)
        modalShadowView.layer.shadowRadius = 16
        modalShadowView.layer.shadowOpacity = 0.1
        modalShadowView.layer.masksToBounds = false
        
        modal.roundCorners([.topLeft, .topRight], radius: 50)
    }
    
    func addComponents() {
        self.addSubview(background)
        self.addSubview(modalShadowView)
        modalShadowView.addSubview(modal)
    }
    
    func setConstraints() {
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        modalShadowView.snp.makeConstraints {
            $0.height.equalTo(Const.modalHeight)
            $0.width.equalTo(Const.modalWidth)
            $0.left.right.bottom.equalToSuperview()
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
    }
    
    public func present(target: UIView) {
        target.addSubview(self)
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        modal.transform = CGAffineTransform(translationX: 0, y: Const.modalHeight)
        UIView.animate(withDuration: 0.35, animations: {
            self.modal.transform = .identity
        }) 
    }
    
    public func dismiss() {
        UIView.animate(withDuration: 0.35, animations: {
            self.modal.transform = CGAffineTransform(translationX: 0, y: Const.modalHeight)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}
