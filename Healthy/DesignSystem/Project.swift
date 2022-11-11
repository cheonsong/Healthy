import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.designSystem.name,
                                dependencies: [.snapKit, .then] + [Module.util.project],
                                resources: .default)
