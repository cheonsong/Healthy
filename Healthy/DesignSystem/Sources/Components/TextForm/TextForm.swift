//
//  TextForm.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/27.
//

import UIKit
import Util

public class TextForm: UITextField {
    
    public convenience init(_ placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gr2.cgColor
        layer.borderWidth = 1
        textAlignment = .center
        backgroundColor = .white
        font = .regular16
        textColor = .black
        delegate = self
        tintColor = .clear
        
        self.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(39)
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TextForm: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.b2.cgColor
        textField.layer.borderWidth = 2
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gr2.cgColor
        textField.layer.borderWidth = 1
    }
}
