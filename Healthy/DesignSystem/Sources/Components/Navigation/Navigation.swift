//
//  Navigation.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/25.
//

import Foundation
import UIKit
import Util
import SnapKit

public enum NavigationType {
    case setting
    case save
    
    var image: UIImage {
        switch self {
        case .setting:
            return DesignSystemAsset.icoSet.image
        case .save:
            return DesignSystemAsset.icoSave.image
        }
    }
}

public class Navigation: UIView {
    
    public let backButton = ButtonBuilder().image(DesignSystemAsset.icoBack.image).view
    public let rightButton = ButtonBuilder().image(DesignSystemAsset.icoSet.image).view
    public let titleLabel = LabelBuilder().font(.bold20).isHidden(true).view
    
    public convenience init(_ type: NavigationType, _ title: String? = nil) {
        self.init(frame: .zero)
        rightButton.setImage(type.image, for: .normal)
        if let title = title {
            titleLabel.text = title
            titleLabel.isHidden = false
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        [backButton, titleLabel, rightButton].forEach { addSubview($0) }
        
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalToSuperview().inset(12)
            $0.width.equalTo(48)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(18)
            $0.width.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
