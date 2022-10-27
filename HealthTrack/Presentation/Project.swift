import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.presentation.name,
                                dependencies: [Module.domain.project, Module.util.project, Module.designSystem.project] + [.rxKeyboard],
                                resources: .default)
