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

public class Navigation: UIView {
    
    public let backButton = Button().image(DesignSystemAsset.icoBack.image).view
    public let setButton = Button().image(DesignSystemAsset.icoSet.image).view
    public let title = Label().isHidden(true).view
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        [backButton, title, setButton].forEach { addSubview($0) }
        
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalToSuperview().inset(12)
            $0.width.equalTo(48)
        }
        
        setButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(18)
            $0.width.equalTo(48)
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
