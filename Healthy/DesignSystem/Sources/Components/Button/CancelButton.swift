//
//  CancelButton.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import Util
import SnapKit

public class CancelButton: UIButton {
    
    public convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .clear
        titleColor = .b2
        layer.cornerRadius = 10
        font = .bold20
        layer.borderColor = UIColor.b2.cgColor
        layer.borderWidth = 2
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - Const.padding * 2)
            $0.height.equalTo(50)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        layer.borderColor = UIColor.b1.cgColor
        titleColor = .b1
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        layer.borderColor = UIColor.b2.cgColor
        titleColor = .b2
    }
    
    public func configure(_ isActivate: Bool) {
        if !isActivate {
            layer.borderColor = UIColor.gr2.cgColor
            titleColor = .gr2
            self.isUserInteractionEnabled = false
        } else {
            layer.borderColor = UIColor.b1.cgColor
            titleColor = .b1
            self.isUserInteractionEnabled = true
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
