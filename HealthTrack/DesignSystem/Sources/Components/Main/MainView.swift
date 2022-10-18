//
//  MainView.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit

public class MainView: UIView {
    
    public var infoView: MainInfoView!
    
    public convenience init(type: Health, frame: CGRect = .zero) {
        self.init(frame: frame)
        
        self.infoView = MainInfoView(type: type)
        self.addSubview(infoView)
        infoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 10, spread: 1, radius: 10)
    }
}
