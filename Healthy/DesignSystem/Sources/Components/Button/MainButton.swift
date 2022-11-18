//
//  Button.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import Util
import SnapKit

public class MainButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .b2
        titleColor = .white
        layer.cornerRadius = 10
        font = .bold20
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - Const.padding * 2)
            $0.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = .b1
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = .b2
    }
    
    public func configure(_ isActivate: Bool) {
        if !isActivate {
            self.backgroundColor = .gr2
            self.isUserInteractionEnabled = false
        } else {
            self.backgroundColor = .b2
            self.isUserInteractionEnabled = true
        }
    }
}
