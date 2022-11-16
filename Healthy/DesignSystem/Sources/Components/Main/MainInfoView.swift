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
    var disposeBag = DisposeBag()
    let innerShadowLayer = CAShapeLayer()
    var circleLayer: CALayer? = nil
    lazy var todayTitleLabel = LabelBuilder("TODAY".localized).font(.regular16).textColor(.black).view
    public lazy var todayContentslabel = LabelBuilder("0 " + self.type.unit)
        .textColor(.black)
        .font(.bold25)
        .attributedTextChangeFont("0 " + self.type.unit, .bold10, [self.type.unit])
        .view
    
    lazy var avgTitleLabel = LabelBuilder("MONTH_AVERAGE".localized).font(.regular16).textColor(.black).view
    public lazy var avgContentslabel = LabelBuilder("0 " + self.type.unit)
        .textColor(.black)
        .font(.bold25)
        .attributedTextChangeFont("0 " + self.type.unit, .bold10, [self.type.unit])
        .view
    
    let circleView = ViewBuilder().backgrouondColor(.clear).view
    lazy var icon = ImageViewBuilder(self.type.icon).view
    
    public convenience init(type: Health, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.type = type
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
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        [todayTitleLabel, avgTitleLabel, todayContentslabel, avgContentslabel, circleView, icon].forEach { addSubview($0) }
    }
    
    func setConstraints() {
        todayTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        todayContentslabel.snp.makeConstraints {
            $0.top.equalTo(todayTitleLabel.snp.bottom)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        avgTitleLabel.snp.makeConstraints {
            $0.left.equalTo(Const.padding)
            $0.bottom.equalTo(avgContentslabel.snp.top)
        }
        
        avgContentslabel.snp.makeConstraints {
            $0.left.equalTo(Const.padding)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        circleView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(Const.padding)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        icon.snp.makeConstraints {
            $0.center.equalTo(circleView)
        }
        
    }
    
    func bind() {
        
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBaseCircle()
    }
    
    func drawBaseCircle() {
        let center = CGPoint(x: 50, y: 50)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: 100 / 2,
                    startAngle: -.pi,
                    endAngle: .pi,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = type.lightColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 15
        layer.lineCap = .round
        
        circleView.layer.addSublayer(layer)
    }
    
    public func drawCircle(value: CGFloat) {
        if let layer = circleLayer {
            layer.removeFromSuperlayer()
        }
        let center = CGPoint(x: 50, y: 50)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: 100 / 2,
                    startAngle: (-(.pi) / 2),
                    endAngle: value * .pi / 2,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = type.deepColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 15
        layer.lineCap = .round
        
        let gaugeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        gaugeAnimation.fromValue = 0
        gaugeAnimation.toValue = 1
        gaugeAnimation.duration = 0.3
//        gaugeAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.02, 1, 0.05)
        layer.add(gaugeAnimation, forKey: "strokeEnd")
        
        circleView.layer.addSublayer(layer)
        circleLayer = layer
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
