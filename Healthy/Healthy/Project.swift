import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: Module.app.name,
                          dependencies: [
                            Module.domain,
                            Module.data,
                            Module.presentation,
                            Module.designSystem,
                            Module.util
                          ].map(\.project) + [.target(name: "WidgetExtension")],
                          resources: .default,
                          scripts: [.localize])
