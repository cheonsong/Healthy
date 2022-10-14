import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "HealthTrack",
                          projects: Module.allCases.map(\.path))
