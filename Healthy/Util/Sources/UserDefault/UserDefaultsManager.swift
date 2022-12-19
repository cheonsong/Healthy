//
//  UserDefaultsManager.swift
//  Util
//
//  Created by cheonsong on 2022/11/22.
//

import Foundation

public struct UserDefaultsManager {
    public static var shared = UserDefaultsManager()
    
    private init() {}
    
    // MARK: User
    public var isFirst : Bool {
        get {
            guard let isFirst = UserDefaults.standard.value(forKey: UserDefaultKey.isFirst.rawValue) as? Bool else {
                return true
            }
            return isFirst
        }
        
        set(isFirst) {
            UserDefaults.standard.set(isFirst, forKey:  UserDefaultKey.isFirst.rawValue)
        }
    }
}

enum UserDefaultKey : String {
    case isFirst
}
