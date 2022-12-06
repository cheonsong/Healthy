//
//  MyPageView.swift
//  DesignSystemTests
//
//  Created by cheonsong on 2022/12/06.
//

import Foundation
import SnapKit
import Then
import Util
import UIKit

public class MyPageView: UIView, CodeBaseUI {
    
    let titleLabel = LabelBuilder().font(.bold16).textColor(.black).view
    let underLine = ViewBuilder().backgrouondColor(UIColor(hex: "#F1F3F4")).view
    let subTitleLabel = LabelBuilder().font(.regular10).isHidden(true).textColor(.gr1).view
    
    public init(text: String) {
        super.init(frame: .zero)
        addComponents()
        setConstraints()
        bind()
        titleLabel.text = text
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func addComponents() {
        [titleLabel, underLine, subTitleLabel].forEach { addSubview($0) }
    }
    
    public func setConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(Const.padding)
            $0.centerY.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.right.equalToSuperview().inset(Const.padding)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        underLine.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    public func bind() {
        
    }
    
    public func isNeedsUpdate(_ bool: Bool) {
        subTitleLabel.isHidden = false
        if bool {
            subTitleLabel.text = "APPVERSION_NEEDS_UPDATE".localized
        } else {
            subTitleLabel.text = "APPVERSION_OK".localized
        }
    }
}
