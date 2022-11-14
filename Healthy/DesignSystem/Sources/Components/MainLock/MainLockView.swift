//
//  MainLockView.swift
//  DesignSystemTests
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import UIKit
import Util
import SnapKit

public class MainLockView: UIView {
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        self.backgroundColor = .dim
        self.layer.cornerRadius = 10
        
        let icoLock = ImageViewBuilder(DesignSystemAsset.icoLock.image).view
        addSubview(icoLock)
        icoLock.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
