//
//  EditViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/08.
//

import Foundation
import UIKit
import Util
import RxCocoa
import RxSwift
import Domain
import DesignSystem
import RxKeyboard

public class EditViewController: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    
    let navigation = Navigation(.save).then {
        $0.title.text = "MYPAGE_EDIT_LABEL".localized
        $0.title.isHidden = false
    }
    let scrollView        = ScrollViewBuilder().backgrouondColor(.clear).view
    let stackView         = StackViewBuilder().axis(.vertical).backgrouondColor(.clear).spacing(20).view
    // NAME
    let nameContainer     = ViewBuilder().backgrouondColor(.clear).view
    let nameTitleLabel    = LabelBuilder("NAME_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let nameTextForm      = TextForm().then { $0.tag = 1 }
    // AGE
    let ageContainer      = ViewBuilder().backgrouondColor(.clear).view
    let ageTitleLabel     = LabelBuilder("AGE_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let ageTextForm       = TextForm().then { $0.tag = 2 }
    // GENDER
    let genderContainer   = ViewBuilder().backgrouondColor(.clear).view
    let genderTitleLabel  = LabelBuilder("GENDER_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let genderTwiceButton = TwiceButton(left: "MALE_TEXT".localized, right: "FEMALE_TEXT".localized)
    // HEIGHT
    let heightContainer   = ViewBuilder().backgrouondColor(.clear).view
    let heightTitleLabel  = LabelBuilder("HEIGHT_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let heightTwiceButton = TwiceButton(left: "cm", right: "inch")
    let heightTextForm    = TextForm().then { $0.tag = 3 }
    // WEIGHT
    let weightContainer   = ViewBuilder().backgrouondColor(.clear).view
    let weightTitleLabel  = LabelBuilder("WEIGHT_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let weightTwiceButton = TwiceButton(left: "kg", right: "lb")
    let weightTextForm    = TextForm().then { $0.tag = 4 }
    
    
    public static func create()-> EditViewController {
        let vc = EditViewController()
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        addComponents()
        setConstraints()
        bind()
        setUserInfo()
    }
    
    /// 초기값 설정 함수
    /// 현재 내 정보를 바탕으로 셋팅해준다
    private func setUserInfo() {
        guard let userInfo = App.state.userInfo.value else { return }
        
        nameTextForm.text = userInfo.name
        ageTextForm.text = String(userInfo.age)
        if userInfo.gender == "male" {
            genderTwiceButton.selectedButton.accept(.left)
        } else {
            genderTwiceButton.selectedButton.accept(.right)
        }
        
        if userInfo.heightUnit == "cm" {
            heightTwiceButton.selectedButton.accept(.left)
        } else {
            heightTwiceButton.selectedButton.accept(.right)
        }
        
        heightTextForm.text = String(userInfo.height)
        
        if userInfo.weightUnit == "kg" {
            weightTwiceButton.selectedButton.accept(.left)
        } else {
            weightTwiceButton.selectedButton.accept(.right)
        }
        
        weightTextForm.text = String(userInfo.weight)
    }
    
    public func addComponents() {
        [navigation, scrollView].forEach { self.view.addSubview($0) }
        scrollView.addSubview(stackView)
        [nameContainer, ageContainer, genderContainer, heightContainer, weightContainer].forEach { stackView.addArrangedSubview($0) }
        [nameTitleLabel, nameTextForm].forEach { nameContainer.addSubview($0) }
        [ageTitleLabel, ageTextForm].forEach { ageContainer.addSubview($0) }
        [genderTitleLabel, genderTwiceButton].forEach { genderContainer.addSubview($0) }
        [heightTitleLabel, heightTwiceButton, heightTextForm].forEach { heightContainer.addSubview($0) }
        [weightTitleLabel, weightTwiceButton, weightTextForm].forEach { weightContainer.addSubview($0) }
    }
    
    public func setConstraints() {
        navigation.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(navigation.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        nameTextForm.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(10)
        }
        
        ageTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        ageTextForm.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(ageTitleLabel.snp.bottom).offset(10)
        }
        
        genderTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        genderTwiceButton.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(genderTitleLabel.snp.bottom).offset(10)
        }
        
        heightTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        heightTwiceButton.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(heightTitleLabel.snp.bottom).offset(10)
        }
        
        heightTextForm.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(heightTwiceButton.snp.bottom).offset(10)
        }
        
        weightTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        weightTwiceButton.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(weightTitleLabel.snp.bottom).offset(10)
        }
        
        weightTextForm.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(weightTwiceButton.snp.bottom).offset(10)
        }
    }
    
    public func bind() {
        // MARK: 선택된 텍스트폼만 보여주기 위해
        nameTextForm.tapGesture
            .subscribe(onNext: { [weak self] _ in
                self?.isContainerHidden(true)
                self?.nameContainer.isHidden = false
                self?.nameContainer.alpha = 1
            })
            .disposed(by: disposeBag)
        
        ageTextForm.tapGesture
            .subscribe(onNext: { [weak self] _ in
                self?.isContainerHidden(true)
                self?.ageContainer.isHidden = false
                self?.ageContainer.alpha = 1
            })
            .disposed(by: disposeBag)
        
        heightTextForm.tapGesture
            .subscribe(onNext: { [weak self] _ in
                self?.isContainerHidden(true)
                self?.heightContainer.isHidden = false
                self?.heightContainer.alpha = 1
            })
            .disposed(by: disposeBag)
        weightTextForm.tapGesture
            .subscribe(onNext: { [weak self] _ in
                self?.isContainerHidden(true)
                self?.weightContainer.isHidden = false
                self?.weightContainer.alpha = 1
            })
            .disposed(by: disposeBag)
        
        // 키보드 내려주기
        scrollView.tapGesture
            .subscribe(onNext: { [weak self] _ in
                self?.view.endEditing(true)
                self?.isContainerHidden(false)
            })
            .disposed(by: disposeBag)
    }
    
    private func isContainerHidden(_ isHidden: Bool) {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
            self.nameContainer.alpha = isHidden ? 0 : 1
            self.ageContainer.alpha = isHidden ? 0 : 1
            self.heightContainer.alpha = isHidden ? 0 : 1
            self.genderContainer.alpha = isHidden ? 0 : 1
            self.weightContainer.alpha = isHidden ? 0 : 1
            self.nameContainer.isHidden   = isHidden
            self.ageContainer.isHidden    = isHidden
            self.heightContainer.isHidden = isHidden
            self.genderContainer.isHidden = isHidden
            self.weightContainer.isHidden = isHidden
        },
                       completion: nil)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        isContainerHidden(false)
    }
    
}
