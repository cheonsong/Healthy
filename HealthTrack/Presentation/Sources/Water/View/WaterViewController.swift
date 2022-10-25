//
//  WaterViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation
import UIKit
import DesignSystem
import Util
import RxSwift

public final class WaterViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    var coordinator: WaterCoordinator?
    
    let mainLabel = Label("오늘 당신이 마신\n물은 750 ml 입니다")
        .numberOfLines(0)
        .textColor(.black)
        .font(.bold25)
        .textAlignment(.center)
        .view
    
    let main = UILabel().then {
        $0.text = "asdfsdaf"
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = .bold10
        $0.textAlignment = .center
    }
    
    let waterBaseView = View()
        .backgrouondColor(.b3)
        .cornerRadius(10)
        .view
    
    let waterView = View()
        .backgrouondColor(.b1)
        .cornerRadius(10)
        .view
    
    let chartView = View().backgrouondColor(.lightGray).view
    
    let drinkButton = Button(MainButton(.water)).title("물 마시기").view
    
    let ballonIcon = UIImageView().then {
        $0.image = PresentationAsset.ballon.image
    }
    
    let ballonLabel = Label("0%")
        .textColor(.white)
        .font(.bold16)
        .view
    
    let guideLine = View().backgrouondColor(.clear).view
    
    let navigation = Navigation()
    
    public static func create()-> WaterViewController {
        let vc = WaterViewController()
        
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
        updateValue(0.5)
    }
    
    func addComponents() {
        [navigation, guideLine, mainLabel, waterBaseView, chartView, drinkButton, ballonIcon].forEach { view.addSubview($0) }
        waterBaseView.addSubview(waterView)
        ballonIcon.addSubview(ballonLabel)
    }
    
    func setConstraints() {
        navigation.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(75)
            $0.centerX.equalToSuperview()
        }
        
        waterBaseView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(100)
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        
        ballonIcon.snp.makeConstraints {
            $0.right.equalTo(waterView.snp.right).offset(30)
            $0.bottom.equalTo(waterView.snp.top).offset(-5)
        }
        
        ballonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-5)
            $0.centerX.equalToSuperview()
        }
        
        waterView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0)
        }
        
        chartView.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(guideLine)
            $0.height.equalTo(200)
        }
        
        drinkButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
        }
        
        guideLine.snp.makeConstraints {
            $0.top.equalTo(waterBaseView.snp.bottom)
            $0.bottom.equalTo(drinkButton.snp.top)
            $0.left.right.equalToSuperview()
        }
    }
    
    func bind() {
        drinkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let waterAddModal = WaterAddModal()
                waterAddModal.present(target: self.view)
            })
            .disposed(by: disposeBag)
        
        navigation.setButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let waterSetModal = WaterSetModal()
                waterSetModal.present(target: self.view, isLong: true)
            })
            .disposed(by: disposeBag)
        
        navigation.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func updateValue(_ value: CGFloat) {
        UIView.animate(withDuration: 1, animations: {
            self.waterView.snp.remakeConstraints {
                $0.height.equalToSuperview()
                $0.left.equalToSuperview()
                $0.width.equalToSuperview().multipliedBy(value)
            }
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        updateValueAnimation(value: value)
    }
    
    func updateValueAnimation(value: CGFloat) {
        let max = value * 100
        updateLabel(value: 0, max: max)
    }
    
    func updateLabel(value: CGFloat, max: CGFloat) {
        if value == max { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1/max, execute: {
            self.ballonLabel.text = "\(Int(value) + 1)%"
            self.updateLabel(value: value + 1, max: max)
        })
        
    }
}
