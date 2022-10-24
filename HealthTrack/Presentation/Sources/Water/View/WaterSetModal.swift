//
//  WaterSetModal.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/24.
//

import Foundation
import DesignSystem
import Util
import UIKit

public class WaterSetModal: ModalView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        setConstraints()
        bind()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addComponents() {
        
    }
    
    func setConstraints() {
        modal.snp.updateConstraints { make in
            make.height.equalTo(Const.modalHeightLong)
        }
    }
    
    func bind() {
        
    }
}
