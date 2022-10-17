//
//  UIApplication+.swift
//  GoodListener
//
//  Created by cheonsong on 2022/09/15.
//

import Foundation
import UIKit

extension UIApplication {
    class func getMostTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getMostTopViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController
            { return getMostTopViewController(base: selected) }
        }

        if let presented = base?.presentedViewController {
            return getMostTopViewController(base: presented)
        }
        return base
    }
    
    class func isUpdateAvailable()-> Bool {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
              let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.heelpass.good-listener"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let results = json["results"] as? [[String: Any]],
              results.count > 0,
              let appStoreVersion = results[0]["version"] as? String else { return false }
        if !(version == appStoreVersion) {
            return true
        } else {
            return false
        }
    }
}
