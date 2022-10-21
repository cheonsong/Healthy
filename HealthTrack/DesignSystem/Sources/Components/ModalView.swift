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

public class ModalView: UIView {
    
    private let modalShadowView = View().backgrouondColor(.clear).view
    
    public let modal = View().backgrouondColor(.gr3).view
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
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
        self.addSubview(modalShadowView)
        modalShadowView.addSubview(modal)
    }
    
    func setConstraints() {
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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
