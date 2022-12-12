//
//  JoinViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/11/21.
//

import Foundation
import DesignSystem
import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Util
import Domain

public enum QuestionCase: Int {
    case name = 1
    case gender = 2
    case age = 3
    case height = 4
    case weight = 5
    
    var localized: String {
        switch self {
        case .name:
            return "JOIN_NAME_LABEL".localized
        case .gender:
            return "JOIN_GENDER_LABEL".localized
        case .age:
            return "JOIN_AGE_LABEL".localized
        case .height:
            return "JOIN_HEIGHT_LABEL".localized
        case .weight:
            return "JOIN_WEIGHT_LABEL".localized
        }
    }
    
    var progress: Float {
        switch self {
        case .name:
            return 0.2
        case .gender:
            return 0.4
        case .age:
            return 0.6
        case .height:
            return 0.8
        case .weight:
            return 1.0
        }
    }
}

public class JoinViewController: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    var state: BehaviorRelay<QuestionCase> = .init(value: .name)
    var viewModel: JoinViewModel!
    
    let titleLabel = LabelBuilder("JOIN_TITLE_LABEL".localized).font(.bold20).textColor(.black).sizeToFit().view
    lazy var progress = UIProgressView(progressViewStyle: .bar).then {
        $0.progressTintColor = .b1
        $0.trackTintColor = .b3
        $0.layer.cornerRadius = 2
        $0.layer.masksToBounds = true
        $0.progress = self.state.value.progress
    }
    
    lazy var questionLabel = LabelBuilder(self.state.value.localized).font(DesignSystemFontFamily.Suit.medium.font(size: 20)).textColor(.black).view
    
    // NAME
    let nameContainer     = ViewBuilder().backgrouondColor(.clear).view
    let nameTextField     = TextForm("NAME_TEXT".localized)
    let nameNextButton    = MainButton("NEXT_BUTTON".localized).then { $0.configure(false) }
    
    // GENDER
    let genderContainer   = ViewBuilder().backgrouondColor(.clear).view
    let genderTwiceButton = TwiceButton(left: "MALE_TEXT".localized, right: "FEMALE_TEXT".localized)
    let genderNextButton  = MainButton("NEXT_BUTTON".localized).then { $0.configure(false) }
    
    // AGE
    let ageContainer      = ViewBuilder().backgrouondColor(.clear).view
    let ageTextField      = TextForm("AGE_TEXT".localized)
    let ageNextButton     = MainButton("NEXT_BUTTON".localized).then { $0.configure(false) }
    
    // HEIGHT
    let heightContainer   = ViewBuilder().backgrouondColor(.clear).view
    let heightTwiceButton = TwiceButton(left: "cm".localized, right: "inch".localized)
    let heightTextField   = TextForm("HEIGHT_TEXT".localized)
    let heightNextButton  = MainButton("NEXT_BUTTON".localized).then { $0.configure(false) }
    
    // WEIGHT
    let weightContainer   = ViewBuilder().backgrouondColor(.clear).view
    let weightTwiceButton = TwiceButton(left: "kg".localized, right: "lb".localized)
    let weightTextField   = TextForm("WEIGHT_TEXT".localized)
    let weightNextButton  = MainButton("COMPLETE_BUTTON".localized).then { $0.configure(false) }
    
    public static func create(viewModel: JoinViewModel)-> JoinViewController {
        let vc = JoinViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setConstraints()
        bind()
    }
    
    lazy var containers = [self.nameContainer,
                           self.genderContainer,
                           self.ageContainer,
                           self.heightContainer,
                           self.weightContainer]
    
    public func addComponents() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        [titleLabel, progress, questionLabel].forEach { view.addSubview($0) }
        containers.forEach { view.addSubview($0) }
        
        [nameTextField, nameNextButton].forEach { nameContainer.addSubview($0) }

        [genderTwiceButton, genderNextButton].forEach { genderContainer.addSubview($0) }
        
        [ageTextField, ageNextButton].forEach { ageContainer.addSubview($0) }
        
        [heightTwiceButton, heightTextField, heightNextButton].forEach { heightContainer.addSubview($0) }
        
        [weightTwiceButton, weightTextField, weightNextButton].forEach { weightContainer.addSubview($0) }
        
    }
    
    public func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        progress.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.height.equalTo(10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(progress.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        containers.forEach { c in
            c.isHidden = true
            c.snp.makeConstraints {
                $0.top.equalTo(questionLabel.snp.bottom).offset(40)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(Const.fullWidth)
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(32)
            }
        }
        
        // NAME
        nameTextField.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        nameNextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
        }
        
        // AGE
        ageTextField.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        ageNextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
        }
        
        // GENDER
        genderTwiceButton.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        genderNextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
        }
        
        // HEIGHT
        heightTwiceButton.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        
        heightTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(heightTwiceButton.snp.bottom).offset(40)
        }
        
        heightNextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
        }
        
        // WEIGHT
        weightTwiceButton.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        
        weightTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(weightTwiceButton.snp.bottom).offset(40)
        }
        
        weightNextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
        }
    }
    
    public func bind() {
        nameNextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.state.accept(.gender)
            })
            .disposed(by: disposeBag)
        
        genderNextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.state.accept(.age)
            })
            .disposed(by: disposeBag)
        
        ageNextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.state.accept(.height)
            })
            .disposed(by: disposeBag)
        
        heightNextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.state.accept(.weight)
            })
            .disposed(by: disposeBag)
        
        weightNextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                
                let gender = self.genderTwiceButton.selectedButtonTitle == "MALE_TEXT".localized ? "male" : "female"
                let goal = self.weightTwiceButton.selectedButtonTitle == "kg" ? (Float(self.weightTextField.text!) ?? 0) * 0.03 : (Float(self.weightTextField.text!) ?? 0) * 0.45 * 0.03
                let model = UserModel(name: self.nameTextField.text ?? "",
                                      height: Int(self.heightTextField.text!) ?? 0,
                                      heightUnit: self.heightTwiceButton.selectedButtonTitle,
                                      weight: Int(self.weightTextField.text!) ?? 0,
                                      weightUnit: self.weightTwiceButton.selectedButtonTitle,
                                      age: Int(self.ageTextField.text ?? "0") ?? 0,
                                      gender: gender,
                                      water: WaterModel(unit: "l", goal: goal))
                print(model)
                
                self.viewModel.completeButtonTapped(model: model)
            })
            .disposed(by: disposeBag)
        
        state
            .subscribe(onNext: { [weak self] stat in
                guard let self = self else { return }
                
                self.questionLabel.text = stat.localized
                self.progress.setProgress(stat.progress, animated: true)
                
                switch stat {
                case .name:
                    self.nameContainer.isHidden = false
                case .gender:
                    self.nameContainer.isHidden = true
                    self.genderContainer.isHidden = false
                case .age:
                    self.genderContainer.isHidden = true
                    self.ageContainer.isHidden = false
                case .height:
                    self.ageContainer.isHidden = true
                    self.heightContainer.isHidden = false
                case .weight:
                    self.heightContainer.isHidden = true
                    self.weightContainer.isHidden = false
                }
            })
            .disposed(by: disposeBag)
        
        // INPUT
        nameTextField.rx.text.orEmpty
            .bind(onNext: viewModel.nameTextInput)
            .disposed(by: disposeBag)
        
        genderTwiceButton.selectedButton
            .bind(onNext: viewModel.genderButtonTapped)
            .disposed(by: disposeBag)
        
        ageTextField.rx.text.orEmpty
            .bind(onNext: viewModel.ageTextInput)
            .disposed(by: disposeBag)
        
        heightTwiceButton.selectedButton
            .bind(onNext: viewModel.heightButtonTapped)
            .disposed(by: disposeBag)
        
        heightTextField.rx.text.orEmpty
            .bind(onNext: viewModel.heightTextInput)
            .disposed(by: disposeBag)
        
        weightTwiceButton.selectedButton
            .bind(onNext: viewModel.weightButtonTapped)
            .disposed(by: disposeBag)
        
        weightTextField.rx.text.orEmpty
            .bind(onNext: viewModel.weightTextInput)
            .disposed(by: disposeBag)
        
        // OUTPUT
        viewModel.nameNextButtonIsActive
            .bind(to: nameNextButton.rx.isActive)
            .disposed(by: disposeBag)
        
        viewModel.nameValidatedText
            .bind(to: nameTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.genderNextButtonIsActive
            .bind(to: genderNextButton.rx.isActive)
            .disposed(by: disposeBag)
        
        viewModel.ageNextButtonIsActive
            .bind(to: ageNextButton.rx.isActive)
            .disposed(by: disposeBag)
        
        viewModel.ageValidatedText
            .bind(to: ageTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.heightValidatedText
            .bind(to: heightTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.heightNextButtonIsActive
            .bind(to: heightNextButton.rx.isActive)
            .disposed(by: disposeBag)
        
        viewModel.weightValidatedText
            .bind(to: weightTextField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.weightNextButtonIsActive
            .bind(to: weightNextButton.rx.isActive)
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}
