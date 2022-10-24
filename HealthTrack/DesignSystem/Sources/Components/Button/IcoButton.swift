//
//  IcoButton.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import UIKit
import Util
import SnapKit

public enum Icon {
    case plus
    case minus
    
    var image: UIImage {
        switch self {
        case .plus:
            return DesignSystemAsset.icoPlus.image
        case .minus:
            return DesignSystemAsset.icoMinus.image
        }
    }
}

public class IcoButton: UIButton {
    
    var type: Health = .water
    var icon: Icon = .plus
    
    public convenience init(type: Health, icon: Icon) {
        self.init(frame: .zero)
        self.type = type
        self.icon = icon
        addComponents()
        setConstraints()
        bind()
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addComponents() {
        backgroundColor = type.mainColor
        self.layer.cornerRadius = 10
        self.setImage(icon.image, for: .normal)
    }
    
    func setConstraints() {
        self.snp.makeConstraints {
            $0.size.equalTo(37)
        }
    }
    
    func bind() {
        
    }
    
    public func configure(_ isActivate: Bool) {
        if !isActivate {
            self.backgroundColor = .gr2
            self.isUserInteractionEnabled = false
        } else {
            self.backgroundColor = type.mainColor
            self.isUserInteractionEnabled = true
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = type.deepColor
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = type.mainColor
    }
}
