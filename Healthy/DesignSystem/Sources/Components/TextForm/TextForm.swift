//
//  TextForm.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/27.
//

import UIKit
import Util

public class TextForm: UITextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gr2.cgColor
        layer.borderWidth = 1
        textAlignment = .center
        backgroundColor = .white
        font = .regular16
        textColor = .black
        
        tintColor = .clear
        
        self.snp.makeConstraints {
            $0.height.equalTo(39)
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
