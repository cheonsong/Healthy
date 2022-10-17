//
//  UILabel+.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/08.
//

import Foundation
import UIKit

extension UILabel {
    // 컬러만 변경
    func textColorChange(text: String, color: UIColor, range: [String]){
        let attributedStr = NSMutableAttributedString(string: text)
        
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
        }
        
        self.attributedText = attributedStr
    }
    // 폰트만 변경
    func textFontChange(text: String, font: UIFont, range: [String]){
        let attributedStr = NSMutableAttributedString(string: text)
        range.forEach {
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        
        self.attributedText = attributedStr
    }
    // 컬러, 폰트 변경
    func textColorAndFontChange(text: String, color: UIColor, font: UIFont, range: [String]){
        let attributedStr = NSMutableAttributedString(string: text)
        
        range.forEach {
            attributedStr.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: $0))
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: $0))
        }
        
        self.attributedText = attributedStr
        
    }
    
    func asFontColor(targetStringList: [String], font: UIFont?, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)

        targetStringList.forEach {
            let range = (fullText as NSString).range(of: $0)
            attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        }
        attributedText = attributedString
    }
    
    
    func textUnderLine(text: String, range: [String]) {
        let attributeString = NSMutableAttributedString(string: text)

        // ✅ 굵기 1의 언더라인과 함께 처음부터 끝까지 밑줄 설정.
        range.forEach {
            attributeString.addAttribute(.underlineStyle, value: 1, range: (text as NSString).range(of: $0))
        }
        self.attributedText = attributeString
    }
}
