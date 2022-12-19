//
//  ToasterExtension.swift
//  Util
//
//  Created by cheonsong on 2022/12/19.
//

import Foundation
import Toaster
import UIKit

extension Toast {
    public static func makeToast(text: String) {
        let toast = Toast(text: text)
        toast.view.font = DesignSystemFontFamily.Suit.regular.font(size: 15)
        toast.view.textInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        toast.show()
    }
}
