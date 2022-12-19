import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.util.name,
                                dependencies: [.rxSwift, .rxCocoa, .rxRelay, .rxGesture, .toaster])
