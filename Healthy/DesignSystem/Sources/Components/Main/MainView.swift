//
//  MainView.swift
//  DesignSystem
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit
import Util
import RxSwift
import RxCocoa
import SnapKit

public class MainView: UIView {
    
    public var isSelected: BehaviorRelay<Bool> = .init(value: false)
    var disposeBag = DisposeBag()
    
    public var infoView: MainInfoView!
    
    public convenience init(type: Health, frame: CGRect = .zero) {
        self.init(frame: frame)
        
        self.infoView = MainInfoView(type: type)
        self.addSubview(infoView)
        infoView.snp.remakeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(Const.mainViewHeight)
            $0.edges.equalToSuperview()
        }
        
        self.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(Const.mainViewHeight)
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
        
        drawDropShadow()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isSelected.accept(true)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isSelected.accept(false)
    }
    
    /// Draw Drop Shadow When View Touched
    func drawDropShadow() {
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 0, blur: 10, spread: 1, radius: 10)
    }
    
    /// Draw Drop Shadow When View Touches Ended
    func hideDropShadow() {
        self.layer.applySketchShadow(color: .black, alpha: 0, x: 0, y: 0, blur: 10, spread: 1, radius: 10)
    }
}
