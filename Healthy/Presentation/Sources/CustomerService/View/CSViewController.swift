//
//  CSViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation
import DesignSystem
import Util
import RxSwift
import RxCocoa
import UIKit
import Toaster

public class CSViewController: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    var viewModel: CSViewModel!
    
    // 상단 네비게이션
    let navigation = Navigation(.none, "CS_TITLE_LABEL".localized)
    // 하단 보내기버튼
    let sendButton = MainButton("SEND_BUTTON".localized).then {
        $0.configure(false)
    }
    
    // 카테고리 선택 피커뷰
    let categories = ["CS_CATEGORY_BUG".localized,
                      "CS_CATEGORY_USE".localized,
                      "CS_CATEGORY_SUGGESTION".localized,
                      "CS_CATEGORY_LANGUAGE".localized,
                      "CS_CATEGORY_ETC".localized]
    
    lazy var pickerView = UIPickerView().then {
        $0.dataSource = self
        $0.delegate = self
    }
    
    // 카테고리 입력 텍스트폼
    lazy var categoryTextForm = TextForm("CS_CATEGORY_PLACEHOLDER".localized).then {
        $0.inputView = pickerView
    }
    
    // 내용 입력 텍스트뷰
    let textViewContainer = ViewBuilder().backgrouondColor(.clear).cornerRadius(10).borderColor(.gr2).borderWidth(1).view
    lazy var textView = TextViewBuilder().font(.regular16).textColor(.black).textContainerInset(UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 15)).delegate(self).view
    let textViewPlaceHolder = LabelBuilder("CS_EMAIL_TEXTFORM".localized).font(.regular16).numberOfLines(0).textColor(.gr2).view
    
    public static func create(viewModel: CSViewModel)-> CSViewController {
        let vc = CSViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setConstraints()
        bind()
        setDoneBtnForTextView()
        setDoneBtnForTextForm()
    }
    
    public func addComponents() {
        view.backgroundColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        [navigation, categoryTextForm, textViewContainer, sendButton].forEach { view.addSubview($0) }
        textViewContainer.addSubview(textView)
        textViewContainer.addSubview(textViewPlaceHolder)
    }
    
    public func setConstraints() {
        navigation.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        categoryTextForm.snp.makeConstraints {
            $0.top.equalTo(navigation.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        textViewContainer.snp.makeConstraints {
            $0.top.equalTo(categoryTextForm.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(Const.padding)
        }
        
        textView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(15)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(textViewContainer.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
        }
        
        textViewPlaceHolder.snp.makeConstraints {
            $0.left.right.equalTo(textViewContainer).inset(20)
            $0.top.equalTo(textViewContainer).inset(15)
        }
    }
    
    public func bind() {
        navigation.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        sendButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.sendButtonTapped(category: self?.categoryTextForm.text ?? "", message: self?.textView.text ?? "")
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(categoryTextForm.rx.text.orEmpty, textView.rx.text.orEmpty) {
            return !$0.isEmpty && !$1.isEmpty
        }
        .bind(to: sendButton.rx.isActive)
        .disposed(by: disposeBag)
        
        textView.rx.text.orEmpty
            .map { !$0.isEmpty }
            .bind(to: textViewPlaceHolder.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.isSendMessageSuccess
            .subscribe(onNext: { [weak self] isSuccess in
                guard let self = self else { return }
                if isSuccess {
                    self.navigationController?.popViewController(animated: true)
                    Toast.makeToast(text: "CS_SEND_SUCCESS".localized)
                } else {
                    Toast.makeToast(text: "NETWORK_ERROR".localized)
                }
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    /// 메인 텍스트뷰의 툴바 설정
    func setDoneBtnForTextView() {
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "DONE_BUTTON".localized, style: .done, target: self, action: #selector(dismissMyKeyboard))
        
        toolBar.setItems([flexSpace, doneBtn], animated: false)
        self.textView.inputAccessoryView = toolBar
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
    
    /// 카테고리 선택뷰의 툴바 설정
    func setDoneBtnForTextForm() {
        // toolbar를 만들어준다.
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        // 만들어줄 버튼
        // flexibleSpace는 취소~완료 간의 거리를 만들어준다.
        let doneBtn = UIBarButtonItem(title: "DONE_BUTTON".localized, style: .done, target: self, action: #selector(self.donePicker))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "CANCEL_BUTTON".localized, style: .plain, target: self, action: #selector(self.cancelPicker))
        
        // 만든 아이템들을 세팅해주고
        toolBar.setItems([cancelBtn,flexSpace,doneBtn], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // 악세사리로 추가한다.
        categoryTextForm.inputAccessoryView = toolBar
    }

    // "완료" 클릭 시 데이터를 textfield에 입력 후 입력창 내리기
    @objc func donePicker() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.categoryTextForm.text = self.categories[row]
        self.categoryTextForm.resignFirstResponder()
    }

    // "취소" 클릭 시 textfield의 텍스트 값을 nil로 처리 후 입력창 내리기
    @objc func cancelPicker() {
        self.categoryTextForm.text = nil
        self.categoryTextForm.resignFirstResponder()
    }
}

extension CSViewController: UITextViewDelegate {
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textViewContainer.layer.borderColor = UIColor.b2.cgColor
        textViewContainer.layer.borderWidth = 2
        return true
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        textViewContainer.layer.borderColor = UIColor.gr2.cgColor
        textViewContainer.layer.borderWidth = 1
        textView.text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension CSViewController: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextForm.text = self.categories[row]
    }
}

extension CSViewController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
}
