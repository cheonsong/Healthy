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

public class CSViewController: UIViewController, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    
    let navigation = Navigation(.none, "CS_TITLE_LABEL".localized)
    let sendButton = MainButton("SEND_BUTTON".localized).then {
        $0.configure(false)
    }
    
    let textViewContainer = ViewBuilder().backgrouondColor(.clear).cornerRadius(10).borderColor(.gr2).borderWidth(1).view
    lazy var textView = TextViewBuilder().font(.regular16).textColor(.black).textContainerInset(UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 15)).delegate(self).view
    
    public static func create()-> CSViewController {
        let vc = CSViewController()
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setConstraints()
        bind()
        setDoneBtn()
    }
    
    public func addComponents() {
        view.backgroundColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        [navigation, textViewContainer, sendButton].forEach { view.addSubview($0) }
        textViewContainer.addSubview(textView)
    }
    
    public func setConstraints() {
        navigation.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        textViewContainer.snp.makeConstraints {
            $0.top.equalTo(navigation.snp.bottom).offset(20)
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
    }
    
    public func bind() {
        navigation.backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func setDoneBtn() {
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "COMPLETE_BUTTON".localized, style: .done, target: self, action: #selector(dismissMyKeyboard))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        self.textView.inputAccessoryView = toolbar
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
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
        sendButton.configure(!textView.text.isEmpty)
    }
}
