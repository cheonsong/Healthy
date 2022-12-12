//
//  AppDIContainer.swift
//  App
//
//  Created by cheonsong on 2022/10/19.
//

import Foundation

final class AppDIContainer {
    
    func makeMainDIContainer()-> MainDIContainer {
        return MainDIContainer()
    }
}

