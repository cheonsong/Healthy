//
//  MainViewController.swift
//  Presentation
//
//  Created by cheonsong on 2022/10/18.
//

import Foundation
import UIKit
import DesignSystem
import Util
import RxSwift
import RxCocoa
import RxGesture
import Domain
import UserNotifications

public class HomeViewController: UIViewController, CodeBaseUI {
    
    var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel?
    var disposeBag = DisposeBag()
    
    let topContainer = ViewBuilder().backgrouondColor(.white).view
    let dateLabel    = LabelBuilder("HOME_DATE_LABEL".localized([DateModel.today.year, ("MONTH_" + DateModel.today.month).localized, DateModel.today.day])).font(.regular16).textColor(.black).sizeToFit().view
    let welcomeLabel = LabelBuilder("HOME_WELCOME_LABEL".localized(["천송"])).font(.bold25).textColor(.black).sizeToFit().view
    let icoCalender  = ImageViewBuilder(PresentationAsset.icoCalender.image).isHidden(true).view
    let calenderView = ViewBuilder().backgrouondColor(.black).cornerRadius(10).alpha(0).view
    
    let scrollView    = ScrollViewBuilder().backgrouondColor(.b3).showsVerticalScrollIndicator(false).view
    let stackView     = StackViewBuilder().axis(.vertical).spacing(30).view
    
    let waterContainer    = ViewBuilder().view
    let stepsContainer    = ViewBuilder().isHidden(true).view
    let caloriesContainer = ViewBuilder().isHidden(true).view
    let sleepContainer    = ViewBuilder().isHidden(true).view
    
    let waterTitle    = LabelBuilder("WATER_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let stepsTitle    = LabelBuilder("STEPS_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let caloriesTitle = LabelBuilder("CALORIES_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    let sleepTitle    = LabelBuilder("SLEEP_TEXT".localized).font(.bold16).textColor(.black).sizeToFit().view
    
    let waterView     = MainView(type: .water)
    let stepView      = MainView(type: .steps)
    let caloriesView  = MainView(type: .calolies)
    let sleepView     = MainView(type: .sleep)
    
    /// MainViewController DI를 위한 Create 함수
    public static func create(viewModel: HomeViewModel)-> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addComponents()
        setConstraints()
        bind()
        viewDidLoadAnimation()
        viewModel?.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        setNotification()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearAction()
        viewModel?.viewWillAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearAction()
    }
    
    public func addComponents() {
        [scrollView, topContainer].forEach { view.addSubview($0) }
        [dateLabel, welcomeLabel, icoCalender, calenderView].forEach { topContainer.addSubview($0) }
        scrollView.addSubview(stackView)
        [waterTitle, waterView].forEach { waterContainer.addSubview($0) }
        [stepsTitle, stepView].forEach { stepsContainer.addSubview($0) }
        [caloriesTitle, caloriesView].forEach { caloriesContainer.addSubview($0) }
        [sleepTitle, sleepView].forEach { sleepContainer.addSubview($0) }
        
        [ViewBuilder().backgrouondColor(.clear).view,
         waterContainer, stepsContainer, caloriesContainer, sleepContainer,
         ViewBuilder().backgrouondColor(.clear).view].forEach { stackView.addArrangedSubview($0) }
        
        topContainer.roundCorners([.bottomLeft, .bottomRight], radius: 20)
    }
    
    public func setConstraints() {
        topContainer.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(112 + Const.safeAreaTop)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24 + Const.safeAreaTop)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        icoCalender.snp.makeConstraints {
            $0.right.equalToSuperview().inset(32)
            $0.bottom.equalTo(welcomeLabel)
        }
        
        calenderView.snp.makeConstraints {
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            $0.height.equalTo(300)
        }
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalToSuperview().inset(-20 + 112 + Const.safeAreaTop)
            $0.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(Const.fullWidth)
            $0.centerX.equalToSuperview()
        }
        
        waterTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        waterView.snp.makeConstraints {
            $0.top.equalTo(waterTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        sleepTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        sleepView.snp.makeConstraints {
            $0.top.equalTo(sleepTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        stepsTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        stepView.snp.makeConstraints {
            $0.top.equalTo(stepsTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
        caloriesTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        
        caloriesView.snp.makeConstraints {
            $0.top.equalTo(caloriesTitle.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
        
    }
    
    public func bind() {
        
        // WaterView 터치이벤트
        waterView.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel?.waterViewTapped()
            })
            .disposed(by: disposeBag)
        
        // 우상단 달력버튼
        icoCalender.rx.tapGesture()
            .when(.recognized)
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.topContainerAnimation(isOpening: self?.calenderView.alpha == 0)
            })
            .disposed(by: disposeBag)
        
        // AppState
        Observable.combineLatest(App.state.waterToday, App.state.waterGoal)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] today, goal in
                self?.waterView.infoView.changeToday(today: today, goal: goal)
            })
            .disposed(by: disposeBag)
        
        App.state.name
            .subscribe(onNext: { [weak self] name in
                self?.welcomeLabel.text = "HOME_WELCOME_LABEL".localized([name])
            })
            .disposed(by: disposeBag)
        
        App.state.waterMontlyList
            .subscribe(onNext: { [weak self] list in
                let map = list.map { $0.progress }
                let sum = map.reduce(0, +)
                self?.waterView.infoView.changeAverage(value: sum / Float(DateModel.today.day)!)
            })
            .disposed(by: disposeBag)
    }
    
    private func viewDidLoadAnimation() {
        self.stepsContainer.transform = CGAffineTransform(translationX: 0, y: -186)
        self.stepsContainer.alpha = 0
        self.caloriesContainer.transform = CGAffineTransform(translationX: 0, y: -186)
        self.caloriesContainer.alpha = 0
        self.sleepContainer.transform = CGAffineTransform(translationX: 0, y: -186)
        self.sleepContainer.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.stepsContainer.transform = .identity
            self.stepsContainer.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.caloriesContainer.transform = .identity
                self.caloriesContainer.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.sleepContainer.transform = .identity
                    self.sleepContainer.alpha = 1
                })
            })
        })
    }
    
    private func topContainerAnimation(isOpening: Bool) {
        if isOpening {
            UIView.animate(withDuration: 0.5, animations: {
                self.calenderView.alpha = 1
                self.topContainer.snp.updateConstraints {
                    $0.height.equalTo(112 + Const.safeAreaTop + 400)
                }
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.calenderView.alpha = 0
                self.topContainer.snp.updateConstraints {
                    $0.height.equalTo(112 + Const.safeAreaTop)
                }
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    private func viewWillAppearAction() {

    }
    
    private func viewDidAppearAction() {
        waterView.infoView.drawCircle(value: CGFloat(App.state.waterToday.value / App.state.waterGoal.value))
    }
    
    func setNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.removeAllPendingNotificationRequests()
        
        let lunchContent = UNMutableNotificationContent()
        lunchContent.title = "LUNCH_PUSH_TITLE".localized
        lunchContent.body = "LUNCH_PUSH_CONTENT".localized
        var lunchDate = DateComponents()
        lunchDate.hour = 12
        lunchDate.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: lunchDate, repeats: true)
        let lunchRequest = UNNotificationRequest(identifier: UUID().uuidString, content: lunchContent, trigger: trigger)
        
        let dinnerContent = UNMutableNotificationContent()
        dinnerContent.title = "DINNER_PUSH_TITLE".localized
        dinnerContent.body = "DINNER_PUSH_CONTENT".localized
        var dinnerDate = DateComponents()
        dinnerDate.hour = 19
        dinnerDate.minute = 00
        
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dinnerDate, repeats: true)
        let lunchRequest2 = UNNotificationRequest(identifier: UUID().uuidString, content: dinnerContent, trigger: trigger2)
        
        notificationCenter.add(lunchRequest, withCompletionHandler: nil)
        notificationCenter.add(lunchRequest2, withCompletionHandler: nil)
    }
}

extension HomeViewController: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.list, .badge, .sound, .banner])
        } else {
            // Fallback on earlier versions
            completionHandler([.badge, .sound])
        }
    }
}
