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
    
    var type: Health!
    
    public convenience init(_ type: Health) {
        self.init(frame: .zero)
        
        self.type = type
        
        backgroundColor = type.mainColor
        titleColor = .white
        layer.cornerRadius = 10
        font = .bold20
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - Const.padding * 2)
            $0.height.equalTo(50)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = type.deepColor
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = type.mainColor
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
