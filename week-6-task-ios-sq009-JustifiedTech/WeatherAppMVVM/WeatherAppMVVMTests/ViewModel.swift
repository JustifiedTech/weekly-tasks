//
//  ViewModel.swift
//  WeatherAppMVVMTests
//
//  Created by Decagon on 11/24/21.
//

import XCTest
@testable import WeatherAppMVVM
class ViewModel: XCTestCase {
    
    var sut:WeatherViewModel!

    override func setUpWithError() throws {
        
        sut = WeatherViewModel.init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDateFormatterForValidValue(){
        
        let  date = "2021-11-24 18:00:00"
       let result = sut.dateFormatter(date)
        
        
        XCTAssertEqual("Wednesday", result)
    }
    
    func testDateFormatterForNil(){
        
        let result = sut.dateFormatter(nil)
        
        XCTAssertNil(result)
        
    }
    
    func testDateFormatterForEmptyString(){
        
        let result = sut.dateFormatter("")
        
        XCTAssertNil(result)
        
    }
    
    func testDateFormatterForInvalid(){
        let  date = "2021-11-24"
        let result = sut.dateFormatter(date)
        XCTAssertNil(result)
        
    }
    

}
