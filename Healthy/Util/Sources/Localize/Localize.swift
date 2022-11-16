//
//  Localize.swift
//  Util
//
//  Created by cheonsong on 2022/09/26.
//

import Foundation
import RxSwift

let CurrentLanguageKey = "currentLanguageKey"

let DefaultLanguage = "en"

let BaseBundle = "Base"

public enum LaguageCode: String, CaseIterable {
    case ko
    case en
    case ja
    
    var text: String {
        switch self {
        case .ko:
            return "Korean".localized
        case .en:
            return "English".localized
        case .ja:
            return "Japanese".localized
        }
    }
}

open class Localize: NSObject {

    ///  An event occurs when the status value changes
    public static var newState: PublishSubject<LaguageCode> = .init()
    /**
     List available languages
     - Returns: Array of available languages.
     */
    open class func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        // If excludeBase = true, don't include "Base" in available languages
        if let indexOfBase = availableLanguages.firstIndex(of: "Base") , excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
    
    /**
     Current language
     - Returns: The current language. String.
     */
    open class func currentLanguage() -> LaguageCode {
        if let currentLanguage = UserDefaults.standard.object(forKey: CurrentLanguageKey) as? String {
            return LaguageCode(rawValue: currentLanguage) ?? defaultLanguage()
        }
        return defaultLanguage()
    }
    
    /**
     Change the current language
     - Parameter code: Desired language code
     */
    open class func setCurrentLanguage(_ code: LaguageCode) {
        let language = code
        
        let selectedLanguage = availableLanguages().contains(language.rawValue) ? language.rawValue : defaultLanguage().rawValue
        if (selectedLanguage != currentLanguage().rawValue){
            UserDefaults.standard.set(selectedLanguage, forKey: CurrentLanguageKey)
            UserDefaults.standard.synchronize()
            
            let code = LaguageCode(rawValue: selectedLanguage) ?? .ko
            newState.onNext(code)
        }
    }
    
    /**
     Default language
     - Returns: The app's default language. String.
     */
    open class func defaultLanguage() -> LaguageCode {
        var defaultLanguage: String = String()
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return LaguageCode(rawValue: DefaultLanguage) ?? .en
        }
        let availableLanguages: [String] = self.availableLanguages()
        if (availableLanguages.contains(preferredLanguage)) {
            defaultLanguage = preferredLanguage
        }
        else {
            defaultLanguage = DefaultLanguage
        }
        return LaguageCode(rawValue: defaultLanguage) ?? .en
    }
    
    /**
     Resets the current language to the default
     */
    open class func resetCurrentLanguageToDefault() {
        setCurrentLanguage(LaguageCode(rawValue: self.defaultLanguage().rawValue) ?? .ko)
    }
    
    /**
     Get the current language's display name for a language.
     - Parameter language: Desired language.
     - Returns: The localized string.
     */
    open class func displayNameForLanguage(_ language: String) -> String {
        let locale : NSLocale = NSLocale(localeIdentifier: currentLanguage().rawValue)
        if let displayName = locale.displayName(forKey: NSLocale.Key.identifier, value: language) {
            return displayName
        }
        return String()
    }
}


extension String {
    public var localized: String {
        return localized(using: nil, in: .main)
    }
    
    /// Format이 있는 로컬라이징 함수 Ex) "My Age %d"
    /// - Parameter arguments: [CVarArg] format에 들어갈 Value값들
    /// $d - Int, %f - Float, %ld - Long, %@ - String
    public func localized(_ arguments: [CVarArg] = [])-> String {
        return String(format: self.localized, arguments: arguments)
    }
    
    private func localized(using tableName: String?, in bundle: Bundle?) -> String {
        let bundle: Bundle = bundle ?? .main
        if let path = bundle.path(forResource: Localize.currentLanguage().rawValue, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        }
        else if let path = bundle.path(forResource: BaseBundle, ofType: "lproj"),
                let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: tableName)
        }
        return self
    }
}
