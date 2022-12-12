import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "Healthy",
                          projects: Module.allCases.map(\.path))
