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

public enum Health: String {
    case water
    case steps
    case calolies
    case sleep
    
    var text: String { return self.rawValue.uppercased() }
    
    var mainColor: UIColor {
        switch self {
        case .water:
            return .b2
        case .steps:
            return .r2
        case .calolies:
            return .g2
        case .sleep:
            return .y2
        }
    }
    
    var unit: String {
        switch self {
        case .water:
            return "ml"
        case .steps:
            return "steps"
        case .calolies:
            return "kcal"
        case .sleep:
            return "hours"
        }
    }
    
    var lightColor: UIColor {
        switch self {
        case .water:
            return .b3
        case .steps:
            return .r3
        case .calolies:
            return .g3
        case .sleep:
            return .y3
        }
    }
    
    var deepColor: UIColor {
        switch self {
        case .water:
            return .b1
        case .steps:
            return .r1
        case .calolies:
            return .g1
        case .sleep:
            return .y1
        }
    }
    
    var icon: UIImage {
        switch self {
        case .water:
            return DesignSystemAsset.icoWater.image
        case .steps:
            return DesignSystemAsset.icoSteps.image
        case .calolies:
            return DesignSystemAsset.icoCalories.image
        case .sleep:
            return DesignSystemAsset.icoSleep.image
        }
    }
}

public class MainInfoView: UIView {
    
    var type: Health = .water
    
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
        
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBaseCircle()
        drawCircle()
        drawInnerCirle()
    }
    
    func drawBaseCircle() {
        let center = circleView.center
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: circleView.frame.height/2,
                    startAngle: 0,
                    endAngle: .pi * 2,
                    clockwise: true)
        
        path.close()
        type.lightColor.set()
        path.fill()
    }
    
    func drawCircle() {
        let center = circleView.center
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: self.center,
                    radius: circleView.frame.height / 2,
                    startAngle: (-(.pi) / 2),
                    endAngle: .pi,
                    clockwise: true)

        path.close()
        type.deepColor.set()
        path.fill()
    }
    
    func drawInnerCirle() {
        let center = circleView.center
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: circleView.frame.height/2 - 10,
                    startAngle: 0,
                    endAngle: .pi * 2,
                    clockwise: true)
        
        path.close()
        type.mainColor.set()
        path.fill()
    }
}
