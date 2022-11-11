//
//  UIButton+.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/05.
//

import Foundation
import UIKit

extension UIButton {
    public var title: String {
        get {
            return self.title(for: .normal) ?? ""
        }
        
        set {
            setTitle(newValue, for: .normal)
        }
        
    }
    
    public var titleColor: UIColor {
        get {
            return self.titleColor(for: .normal) ?? .white
        }
        
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    public var color: UIColor {
        get {
            return self.backgroundColor ?? .white
        }
        
        set {
            backgroundColor = newValue
        }
    }
    
    public var font: UIFont {
        get {
            return self.titleLabel?.font ?? .systemFont(ofSize: 15)
        }
        
        set {
            self.titleLabel?.font = newValue
        }
    }
}
