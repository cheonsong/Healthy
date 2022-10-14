import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "App",
                          dependencies: [
                            Module.domain,
                            Module.data,
                            Module.presentation,
                            Module.designSystem,
                            Module.util
                          ].map(\.project),
                          resources: .default)
