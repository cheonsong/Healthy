import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.data.name,
                                dependencies: [Module.domain.project, Module.util.project] + [.xcframework(path: .relativeToRoot("Healthy/Data/Framework/RealmSwift.xcframework")), .xcframework(path: .relativeToRoot("Healthy/Data/Framework/Realm.xcframework"))])
