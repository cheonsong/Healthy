//
//  CSViewModel.swift
//  Presentation
//
//  Created by cheonsong on 2022/12/16.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

protocol CSViewModelInput {
    func sendButtonTapped(category: String, message: String)
}

protocol CSViewModelOutput {
    var isSendMessageSuccess: PublishRelay<Bool> { get }
}

public class CSViewModel: CSViewModelOutput {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - Output
    var isSendMessageSuccess: PublishRelay<Bool> = .init()
    
    // MARK: - Usecase
    private var usecase: SendMessageToSlackUsecaseProtocol
    
    public init(usecase: SendMessageToSlackUsecaseProtocol) {
        self.usecase = usecase
    }
    
}

extension CSViewModel: CSViewModelInput {
    public func sendButtonTapped(category: String, message: String) {
        usecase.send(category: category, message: message)
    }
}


