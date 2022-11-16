//
//  StepsViewController.swift
//  PresentationTests
//
//  Created by cheonsong on 2022/10/28.
//

import Foundation
import UIKit
import DesignSystem
import Util
import RxSwift

public final class StepsViewController: UIViewController, CodeBaseUI {
    
    var type: Health = .steps
    var disposeBag = DisposeBag()
    var coordinator: StepsCoordinator?
    
    let mainLabel = LabelBuilder("오늘 당신의 걸음은\n9563 걸음 입니다")
        .numberOfLines(0)
        .textColor(.black)
        .font(.bold25)
        .textAlignment(.center)
        .attributedTextChangeColor("오늘 당신의 걸음은\n9563 걸음 입니다", .r2, ["9563 걸음"])
        .view
    
    let circleView = ViewBuilder().backgrouondColor(.clear).view
    let countLabel = LabelBuilder("0%").font(.bold25).textColor(.black).view
    
    let consumedLabel = LabelBuilder("소비 칼로리: 300kcal").font(.bold20).textColor(.black).attributedTextChangeColor("소비 칼로리: 300kcal", .r2, ["300kcal"]).textAlignment(.left).view
    
    let guideLine = ViewBuilder().backgrouondColor(.clear).view
    
    let navigation = Navigation()
    
    let calendar = CommitView()
    
    public static func create()-> StepsViewController {
        let vc = StepsViewController()
        
        return vc
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addComponents()
        setConstraints()
        bind()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateValue(0.6)
    }
    
    public func addComponents() {
        [navigation, guideLine, mainLabel, circleView, countLabel, consumedLabel, calendar].forEach { view.addSubview($0) }
    }
    
    public func setConstraints() {
        navigation.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        circleView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(26)
            $0.size.equalTo(130)
            $0.centerX.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints {
            $0.center.equalTo(circleView)
        }
        
        consumedLabel.snp.makeConstraints {
            $0.top.equalTo(circleView.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(Const.padding)
        }
        
        calendar.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.top.equalTo(consumedLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func bind() {
        navigation.setButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                // TODO: SetModal
                let modal = StepsSetModal()
                modal.present(target: self.view)
            })
            .disposed(by: disposeBag)
        
        navigation.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        view.rx.screenEdgePanGesture()
            .map({$0.edges = .left; return $0})
            .when(.began, .changed, .ended)
            .subscribe(onNext: { [weak self] pan in
                guard let self = self else { return }
                switch pan.state {
                case .ended:
                    self.dismiss(animated: true)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
    
    func updateValue(_ value: CGFloat) {
        drawBaseCircle()
        drawCircle()
        updateValueAnimation(value: value)
    }
    
    func updateValueAnimation(value: CGFloat) {
        let max = value * 100
        updateLabel(value: 0, max: max)
    }
    
    func updateLabel(value: CGFloat, max: CGFloat) {
        if value == max { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1/max, execute: {
            self.countLabel.text = "\(Int(value) + 1)%"
            self.updateLabel(value: value + 1, max: max)
        })
        
    }
    
    func drawBaseCircle() {
        let center = CGPoint(x: 65, y: 65)
        print(center)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: 130 / 2,
                    startAngle: -.pi,
                    endAngle: .pi,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.r3.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 20
        layer.lineCap = .round
        
        circleView.layer.addSublayer(layer)
    }
    
    func drawCircle() {
        let center = CGPoint(x: 65, y: 65)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                    radius: 130 / 2,
                    startAngle: (-(.pi) / 2),
                    endAngle: .pi * 1.5,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.r1.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 20
        layer.lineCap = .round
        
        let gaugeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        gaugeAnimation.fromValue = 0
        gaugeAnimation.toValue = 1
        gaugeAnimation.duration = 1
//        gaugeAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.02, 1, 0.05)
        layer.add(gaugeAnimation, forKey: "strokeEnd")
        
        circleView.layer.addSublayer(layer)
    }
}


