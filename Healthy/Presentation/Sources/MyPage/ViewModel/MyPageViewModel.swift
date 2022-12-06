//
//  MyPageViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/06.
//

import Foundation
import Util

public protocol MyPageViewModelAction {
    func moveToEditViewController()
}

protocol MyPageViewModelInpput {
    func editInfoTapped()
    func setAlarmTapped()
    func initDataTapped()
    func appVersionTapped()
}

protocol MyPageViewModelOutput {
    
}

public class MyPageViewModel: MyPageViewModelOutput {
    
    var action: MyPageViewModelAction
    
    public init(action: MyPageViewModelAction) {
        self.action = action
    }
}

extension MyPageViewModel: MyPageViewModelInpput {
    func editInfoTapped() {
        action.moveToEditViewController()
    }
    
    func setAlarmTapped() {
        
    }
    
    func initDataTapped() {
        
    }
    
    func appVersionTapped() {
        
    }
}
