import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.data.name,
                                dependencies: [Module.domain.project, Module.util.project] + [.realm, .realmSwift, .swiftyJson, .rxMoya, .quick, .nimble])
