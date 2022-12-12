//
//  ScriptExtension.swift
//  ProjectDescriptionHelpers
//
//  Created by cheonsong on 2022/10/05.
//

import ProjectDescription

extension ProjectDescription.TargetScript {
    public static let localize = TargetScript.pre(script: "python3.10 ../../Scripts/localize.py", name: "Localize", basedOnDependencyAnalysis: true, runForInstallBuildsOnly: true)
    //public static let localize = TargetScript.pre(path: .relativeToRoot("Scripts/Localize.sh"), name: "Localize")
}
