import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.domain.name,
                                dependencies: [Module.util.project] + [.slackKit])
