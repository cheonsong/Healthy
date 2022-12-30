//
//  ValidationTest.swift
//  DomainTests
//
//  Created by cheonsong on 2022/12/30.
//

import Foundation
import Domain
import Quick
import Nimble

class ValidationQuickNimbleTest: QuickSpec {
    
    override func spec() {
        let sut = ValidationUseCase()
        
        describe("사용자가 나이를 입력한다") {
            context("문자와 숫자를 입력한다") {
                it("문자는 입력되지 않는다") {
                    expect(sut.onlyDigit("1a1s1d1")).to(equal("1111"))
                }
            }
        }
        
        describe("사용자가 나이를 입력한다") {
            context("첫번째 숫자에 0을 입력한다") {
                it("첫번째 숫자로 0은 입력되지 않는다") {
                    expect(sut.onlyDigit("0")).to(equal(""))
                }
            }
        }
        
        describe("사용자가 이름을 입력한다") {
            context("15자이상 입력한다") {
                it("15자까지만 입력된다") {
                    expect(sut.nameValidation("abceasdfsa sadfasd").count) <= 15
                }
            }
        }
    }
}
