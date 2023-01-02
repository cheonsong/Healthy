//
//  System.swift
//  Util
//
//  Created by cheonsong on 2023/01/02.
//

import Foundation
import UIKit

public struct System {
    public init() {}
    // 현재 버전 정보 : 타겟 -> 일반 -> Version
    public static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    // 개발자가 내부적으로 확인하기 위한 용도 : 타겟 -> 일반 -> Build
    public static let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    public static let appStoreOpenUrlString = "https://apps.apple.com/kr/app/healthy/id1658676877"
    
    // 앱 스토어 최신 정보 확인
    //
    public func latestVersion() -> String? {
        guard let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.cheonsong.healthy"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let results = json["results"] as? [[String: Any]],
              let appStoreVersion = results[0]["version"] as? String else {
            return nil
        }
        return appStoreVersion
    }
    
    // 앱 스토어로 이동 -> urlStr 에 appStoreOpenUrlString 넣으면 이동
    //
    public func openAppStore() {
        guard let url = URL(string: System.appStoreOpenUrlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
