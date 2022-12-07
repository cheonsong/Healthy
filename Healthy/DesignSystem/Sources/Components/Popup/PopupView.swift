//
//  PopupView.swift
//  DesignSystemTests
//
//  Created by cheonsong on 2022/12/06.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import Util
/**
    title, contents, completeAction, cancelAction, cancelIsHidden 프로퍼티로 설정 가능
 */
public class PopupView: UIView, CodeBaseUI {
    
    var disposeBag = DisposeBag()
    /// EX) popup.title = ""
    public var title: String {
        get {
            return titleLbl.text ?? ""
        }
        
        set {
            titleLbl.text = newValue
        }
    }
    
    /// EX) popup.contents = ""
    public var contents: String {
        get {
            return contentsLbl.text ?? ""
        }
        
        set {
            contentsLbl.text = newValue
        }
    }
    
    /// EX) popup.cancelIsHidden = true
    public var cancelIsHidden: Bool {
        get {
            return cancelBtn.isHidden
        }
        
        set {
            cancelBtn.isHidden = newValue
        }
    }
    
    public var alignment: NSTextAlignment {
        get {
            return titleLbl.textAlignment
        }
        
        set {
            titleLbl.textAlignment = newValue
            contentsLbl.textAlignment = newValue
        }
    }
    
    public var completeBtnTitle: String {
        get {
            return completeBtn.title
        }
        
        set {
            completeBtn.title = newValue
        }
    }
    
    public var cancelBtnTitle: String {
        get {
            return cancelBtn.title
        }
        
        set {
            cancelBtn.title = newValue
        }
    }
    
    /// 팝업을 만들어주는 함수
    /// - Parameter title: 제목
    /// - Parameter contents: 내용
    /// - Parameter isCancelHidden: 취소 히든 여부
    /// - Parameter completeAction: 완료 버튼 액션
    /// - Parameter cancelAction: 취소 버튼 액션
    /// - Returns PopupView
    public static func makePopup(title: String,
                          contents: String,
                          isCancelHidden: Bool,
                          completeAction: (()->Void)? = nil,
                          cancelAction: (()->Void)? = nil)-> PopupView {
        let popup = PopupView()
        popup.title = title
        popup.contents = contents
        popup.cancelIsHidden = isCancelHidden
        popup.completeAction = completeAction
        popup.cancelAction = cancelAction
        return popup
    }
    
    /// EX) popup.completeAction = { ~~ }
    public var completeAction: (()->Void)? = nil
    /// EX) popup.cancelAction = { ~~ }
    public var cancelAction: (()->Void)? = nil
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.6)
    }
    
    private let container = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let titleLbl = UILabel().then {
        $0.text = "타이틀"
        $0.font = DesignSystemFontFamily.Suit.bold.font(size: 16)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private let contentsLbl = UILabel().then {
        $0.text = "컨텐츠"
        $0.font = DesignSystemFontFamily.Suit.regular.font(size: 14)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let buttonStackView = UIStackView().then {
        $0.backgroundColor = .clear
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private let completeBtn = UIButton().then {
        $0.title = "COMPLETE_BUTTON".localized
        $0.font = DesignSystemFontFamily.Suit.bold.font(size: 14)
        $0.titleColor = .b2
        $0.backgroundColor = .clear
        $0.layer.addBorder([.top], color: .gr2, width: 1)
    }
    
    private let cancelBtn = UIButton().then {
        $0.title = "CANCEL_BUTTON".localized
        $0.font = DesignSystemFontFamily.Suit.bold.font(size: 14)
        $0.titleColor = .b2
        $0.backgroundColor = .clear
        $0.layer.addBorder([.top], color: .gr2, width: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ frame: CGRect) {
        super.draw(frame)
        if self.cancelIsHidden == true {
            completeBtn.layer.addBorder([.top], color: .gr2, width: 1)
        } else {
            completeBtn.layer.addBorder([.top], color: .gr2, width: 1)
            completeBtn.layer.addBorder([.left], color: .gr2, width: 0.5)
            cancelBtn.layer.addBorder([.top], color: .gr2, width: 1)
            cancelBtn.layer.addBorder([.right], color: .gr2, width: 0.5)
        }
    }
    
    public func addComponents() {
        [backgroundView, container].forEach { addSubview($0) }
        [titleLbl, contentsLbl, buttonStackView].forEach { container.addSubview($0) }
        [cancelBtn, completeBtn].forEach { buttonStackView.addArrangedSubview($0) }
    }
    
    public func setConstraints() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        container.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Const.padding)
        }
        
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        contentsLbl.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(17)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(contentsLbl.snp.bottom).offset(42)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(48)
        }
    }
    
    public func bind() {
        completeBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                if let action = self?.completeAction {
                    action()
                }
                self?.removeFromSuperview()
            })
            .disposed(by: disposeBag)
        
        cancelBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                if let action = self?.cancelAction {
                    action()
                }
                self?.removeFromSuperview()
            })
            .disposed(by: disposeBag)
        
        backgroundView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                if let action = self?.cancelAction {
                    action()
                }
                self?.removeFromSuperview()
            })
            .disposed(by: disposeBag)
    }
    
    deinit {
        Log.d("Popup Deinit")
        cancelAction = nil
        completeAction = nil
    }
}
