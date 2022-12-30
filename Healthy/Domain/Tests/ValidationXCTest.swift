//
//  HealthyTest.swift
//  HealthyTests
//
//  Created by cheonsong on 2022/12/12.
//

import XCTest
import Domain

final class ValidationXCTest: XCTestCase {
    
    var sut: ValidationUseCase?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ValidationUseCase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        testValidationUsecase_WhenOnlyDigit_ShouldReturnOnlyDigit()
        
        testValidationUsecase_WhenFirstText0_ShouldReturnEmptyString()
        
        testValidationUsecase_WhenOver15_ShouldReturnUnder15()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidationUsecase_WhenOnlyDigit_ShouldReturnOnlyDigit() {
        let text = "0123565aw8"
        
        let validatedText = sut?.onlyDigit(text)
        
        XCTAssertEqual(validatedText, "01235658", "숫자만 존재하지 않습니다.")
    }
    
    func testValidationUsecase_WhenFirstText0_ShouldReturnEmptyString() {
        let text = "0"
        
        let validatedText = sut?.onlyDigit(text)
        
        XCTAssertEqual(validatedText, "", "첫번째 문자에 0이 존재합니다.")
    }
    
    func testValidationUsecase_WhenOver15_ShouldReturnUnder15() {
        let text = "akgnekl wkefnse124124"
        
        let validatedText = sut?.nameValidation(text)
        
        XCTAssertTrue(validatedText!.count <= 15, "이름이 15자 이상입니다.")
    }

}
