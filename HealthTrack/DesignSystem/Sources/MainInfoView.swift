//
//  AppDelegate.swift
//  av
//
//  Created by cheonsong on 2022/09/05.
//

import UIKit
import Util
import SnapKit
import Then

class MainInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
        bind()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addComponents() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
    }
    
    func setConstraints() {
        
    }
    
    func bind() {
        
    }
}
