//
//  DataPassingTest.swift
//  PetsTesting
//
//  Created by Decagon on 11/17/21.
//

import XCTest

@testable import Pets
class DataPassingTest: XCTestCase {
    
    
    
    func testCanPassDataToStruct(){
        
        let json = """
        {
        "id": 1,
        "name": "Affenpinscher",
        "image":
                {
            "id": "BJa4kxc4X",
            "width": 1600,
            "height": 1199,
            "url": "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg"
        }
}
"""
        
        let jsonData = json.data(using: .utf8)!
        let DogData = try! JSONDecoder().decode(DogElement.self, from: jsonData)
        
        XCTAssertEqual(1, DogData.id!)
        XCTAssertEqual("Affenpinscher", DogData.name!)
        
        
        
    }
    
}
