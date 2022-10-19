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
import RxSwift
import RxCocoa

public class MainInfoView: UIView {
    
    var type: Health = .water
    var isSelected: BehaviorRelay<Bool>!
    var disposeBag = DisposeBag()
    let innerShadowLayer = CAShapeLayer()
    
    lazy var titleLabel = UILabel().then {
        $0.text = self.type.text
        $0.textColor = .white
        $0.font = .bold16
    }
    
    let circleView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    lazy var unitLabel = UILabel().then {
        $0.text = "1000 " + self.type.unit
        $0.textColor = .white
        $0.font = .bold20
        $0.textFontChange(text: "1000 " + self.type.unit, font: .bold10, range: [self.type.unit])
    }
    
    lazy var icon = UIImageView().then {
        $0.image = self.type.icon
    }
    
    public convenience init(type: Health, isSelected: BehaviorRelay<Bool>, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.type = type
        self.isSelected = isSelected
        addComponents()
        setConstraints()
        bind()
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addComponents() {
        self.backgroundColor = type.mainColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        [titleLabel, circleView, unitLabel, icon].forEach { addSubview($0) }
    }
    
    func setConstraints() {
        self.snp.makeConstraints {
            $0.width.equalTo((UIScreen.main.bounds.width - 60 - 35) / 2)
            $0.height.equalTo(self.snp.width).multipliedBy(1.3)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(20)
        }
        
        circleView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo((UIScreen.main.bounds.width - 60 - 35) / 4)
        }
        
        unitLabel.snp.makeConstraints {
            $0.left.bottom.equalToSuperview().inset(20)
        }
        
        icon.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    func bind() {
        // MainView Selected Action
        isSelected.subscribe(onNext: { [weak self] isSelected in
            guard let self = self else { return }
            
            isSelected ? self.drawInnerShadow() : self.innerShadowLayer.removeFromSuperlayer()
            self.layoutIfNeeded()
        })
        .disposed(by: disposeBag)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBaseCircle()
        drawCircle()
    }
    
    func drawBaseCircle() {
        let center = CGPoint(x: self.center.x/2, y: self.center.y/2 - 10)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: circleView.frame.height / 2,
                    startAngle: -.pi,
                    endAngle: .pi,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = type.lightColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 10
        layer.lineCap = .round
        
        circleView.layer.addSublayer(layer)
    }
    
    func drawCircle() {
        let center = CGPoint(x: self.center.x/2, y: self.center.y/2 - 10)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: circleView.frame.height / 2,
                    startAngle: (-(.pi) / 2),
                    endAngle: .pi,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = type.deepColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 10
        layer.lineCap = .round
        
        let gaugeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        gaugeAnimation.fromValue = 0
        gaugeAnimation.toValue = 1
        gaugeAnimation.duration = 0.7
        gaugeAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.02, 1, 0.05)
        layer.add(gaugeAnimation, forKey: "strokeEnd")
        
        circleView.layer.addSublayer(layer)
    }
    
    /// Draw Inner Shadow When Selected
    func drawInnerShadow() {
        innerShadowLayer.shadowColor = UIColor.black.cgColor
        innerShadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        innerShadowLayer.shadowOpacity = 0.25
        innerShadowLayer.shadowRadius = 10
        innerShadowLayer.fillRule = .evenOdd
        
        let shadowPath = CGMutablePath()
        let inset = -innerShadowLayer.shadowRadius * 2.0
        shadowPath.addRect(self.bounds.insetBy(dx: inset, dy: inset))
        shadowPath.addRect(self.bounds)
        innerShadowLayer.path = shadowPath
        
        self.layer.addSublayer(innerShadowLayer)
    }
}
