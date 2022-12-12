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
    public var name : String {
        get {
            guard let name = UserDefaults.standard.value(forKey: UserDefaultKey.name.rawValue) as? String else {
                return ""
            }
            return name
        }
        
        set(name) {
            UserDefaults.standard.set(name, forKey:  UserDefaultKey.name.rawValue)
        }
    }
    
    public var age : Int {
        get {
            guard let age = UserDefaults.standard.value(forKey: UserDefaultKey.age.rawValue) as? Int else {
                return 0
            }
            return age
        }
        
        set(age) {
            UserDefaults.standard.set(age, forKey:  UserDefaultKey.age.rawValue)
        }
    }
    
    public var gender : String {
        get {
            guard let gender = UserDefaults.standard.value(forKey: UserDefaultKey.gender.rawValue) as? String else {
                return "GENDER_TEXT".localized
            }
            return gender
        }
        
        set(gender) {
            UserDefaults.standard.set(gender, forKey:  UserDefaultKey.gender.rawValue)
        }
    }
    
    public var waterGoal : Float {
        get {
            guard let waterGoal = UserDefaults.standard.value(forKey: UserDefaultKey.waterGoal.rawValue) as? Float else {
                return 2
            }
            return waterGoal
        }
        
        set(waterGoal) {
            UserDefaults.standard.set(waterGoal, forKey:  UserDefaultKey.waterGoal.rawValue)
        }
    }
}

enum UserDefaultKey : String {
    case name
    case age
    case gender
    case waterGoal
}
