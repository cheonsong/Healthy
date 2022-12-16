//
//  Dependencies.swift
//  Config
//
//  Created by cheonsong on 2022/09/05.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
            .rxSwift,
            .snapKit,
            .then,
            .lottie,
            .rxGesture,
            .swiftyJson,
            .rxKeyboard,
            .moya,
            .slackKit
    ],
    platforms: [.iOS]
)

public extension Package {
    static let rxSwift: Package       = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .branch("main"))
    static let rxDataSources: Package = .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources", requirement: .branch("main"))
    static let snapKit: Package       = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0.1"))
    static let then: Package          = .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "2.7.0"))
    static let lottie: Package        = .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .upToNextMajor(from: "3.2.1"))
    static let rxKeyboard: Package    = .remote(url: "https://github.com/RxSwiftCommunity/RxKeyboard", requirement: .upToNextMajor(from: "2.0.0"))
    static let rxGesture: Package     = .remote(url: "https://github.com/RxSwiftCommunity/RxGesture", requirement: .upToNextMajor(from: "4.0.4"))
    static let swiftyJson: Package    = .remote(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", requirement: .upToNextMajor(from: "4.0.0"))
    static let rxRealm: Package       = .remote(url: "https://github.com/RxSwiftCommunity/RxRealm.git", requirement: .branch("main"))
    static let moya: Package          = .remote(url: "https://github.com/Moya/Moya.git", requirement: .branch("master"))
    static let slackKit: Package = .remote(url: "https://github.com/pvzig/SlackKit.git", requirement: .branch("main"))
}

public extension CarthageDependencies.Dependency {
    static let realm: CarthageDependencies.Dependency = .github(path: "realm/realm-swift", requirement: .branch("master"))
}
