//
//  ScriptExtension.swift
//  ProjectDescriptionHelpers
//
//  Created by cheonsong on 2022/10/05.
//

import ProjectDescription

extension ProjectDescription.TargetScript {
    public static let localize = TargetScript.pre(path: .relativeToRoot("Scripts/Localize.sh"), name: "Localize")
}
