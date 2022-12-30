//
//  UserRepositoryTest.swift
//  DataTests
//
//  Created by cheonsong on 2022/12/30.
//

import Foundation
import Data
import Quick
import Nimble
import Domain
import RxSwift

class UserRepositoryTest: QuickSpec {
    override func spec() {
        let sut = UserRepository()
        
        describe("유저 정보 조회") {
            context("앱 실행 시 유저 데이터를 조회합니다") {
                it("유저데이터는 최대 한개까지 조회가능합니다") {
                    sut.fetchUserInfo()
                        .subscribe(onSuccess: {
                            if $0.isEmpty {
                                expect($0.isEmpty).to(beTrue())
                            } else {
                                expect($0.count) == 1
                            }
                            
                        })
                        .dispose()
                }
            }
        }
        
        let testModel = UserModel(name: "Test",
                                  height: 10,
                                  heightUnit: "Test",
                                  weight: 10,
                                  weightUnit: "Test",
                                  age: 10,
                                  gender: "Test",
                                  water: WaterModel(unit: "Test", goal: 10))
        
        describe("유저 정보 삽입") {
            context("최초 실행시 가입 정보를 DB에 저장합니다") {
                it("저장성공 시 데이터를 그대로 리턴합니다") {
                    sut.addUserInfo_Test(model: testModel)
                        .subscribe(onSuccess: { user in
                            expect(user).to(equal(testModel))
                        })
                        .dispose()
                }
            }
        }
    }
}
