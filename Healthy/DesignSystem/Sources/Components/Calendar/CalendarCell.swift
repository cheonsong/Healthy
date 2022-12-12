//
//  CalendarCell.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/26.
//

import Foundation
import Util
import UIKit

public class CalendarCell: UICollectionViewCell {
    static let identifier = "CalendarCell"
    
    let commit = ViewBuilder().cornerRadius(5).backgrouondColor(.clear).view
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gr2.cgColor
        
        contentView.addSubview(commit)
        commit.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalToSuperview()
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
