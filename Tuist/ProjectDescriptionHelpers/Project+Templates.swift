import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    static let bundleID = "com.cheonsong.healthy"
    static let iosVersion = "13.0"
    
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        scripts: [TargetScript] = []
    ) -> Project {
        return self.project(
            name: name,
            product: .app,
            bundleID: bundleID,
            dependencies: dependencies,
            resources: resources,
            scripts: scripts
        )
    }
}

extension Project {
    public static func framework(name: String,
                                 dependencies: [TargetDependency] = [],
                                 resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .project(name: name,
                        product: .framework,
                        bundleID: bundleID + ".\(name)",
                        dependencies: dependencies,
                        resources: resources)
    }
    
    
    
    public static func project(
        name: String,
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        scripts: [TargetScript] = []
    ) -> Project {
        return Project(
            name: name,
            //settings: .settings(base: .init().automaticCodeSigning(devTeam: "GP9D94CZ57")),
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: product,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: iosVersion, devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
                    sources: ["Sources/**"],
                    resources: resources,
                    scripts: scripts,
                    dependencies: dependencies,
                    settings: .settings(configurations: [.release(name: .release, settings: makeSettingDictionary()), .debug(name: .debug, settings: makeSettingDictionary())])
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: iosVersion, devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
                    sources: "Tests/**",
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ],
            schemes: schemes
        )
    }
    
    static func makeSettingDictionary()-> SettingsDictionary {
        return SettingsDictionary().automaticCodeSigning(devTeam: "7ZK7Q3JHK4").merging(["VERSIONING_SYSTEM": "apple-generic",
                                                                                         "CURRENT_PROJECT_VERSION": "1.0.0"])
    }
}

public extension TargetDependency {
    static let rxSwift: TargetDependency         = .external(name: "RxSwift")
    static let rxCocoa: TargetDependency         = .external(name: "RxCocoa")
    static let rxRelay: TargetDependency         = .external(name: "RxRelay")
    static let rxDataSources: TargetDependency   = .external(name: "RxDataSources")
    static let alamofire: TargetDependency       = .external(name: "Alamofire")
    static let moya: TargetDependency            = .external(name: "Moya")
    static let rxMoya: TargetDependency          = .external(name: "RxMoya")
    static let snapKit: TargetDependency         = .external(name: "SnapKit")
    static let then: TargetDependency            = .external(name: "Then")
    static let kingfisher: TargetDependency      = .external(name: "Kingfisher")
    static let rxKeyboard: TargetDependency      = .external(name: "RxKeyboard")
    static let lottie: TargetDependency          = .external(name: "Lottie")
    static let rxGesture: TargetDependency       = .external(name: "RxGesture")
    static let swiftyJson: TargetDependency      = .external(name: "SwiftyJSON")
    static let rxRealm: TargetDependency         = .external(name: "RxRealm")
    static let realm: TargetDependency           = .external(name: "RealmSwift")
}
