//
//  DeleFromFaveTest.swift
//  PetsTesting
//
//  Created by Decagon on 11/17/21.
//

import XCTest
@testable import Pets

class DeleFromFaveTest: XCTestCase {
    
    
    var data :DogBreedData!
    var model:DogModel!
    
    
    
    override func setUpWithError() throws {
        data = DogBreedData.dogBreedData
        
    }
    
    
    override func tearDownWithError() throws {
        data = nil
    }
    
    func testIfDeletes(){
        
        model = DogModel(dogId: 1, dogName: "Akita", dogImage: "", isDogFavourite: false)
        
        data.deleteDogFromFave(from: model)
        
              
        _ =  XCTestCaseRun.self
        
    }
    
    
    func testFavouriteToggle(){
        
        let json = """
        [ {
    
        "id": 1,
        "name": "Affenpinscher",
        "image":
                {
            "id": "BJa4kxc4X",
            "width": 1600,
            "height": 1199,
            "url": "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg"
        }
    },
    
     {
            
            "id": 2,
            "name": "Afghan Hound",
            "image": {
                "id": "hMyT4CDXR",
                "width": 606,
                "height": 380,
                "url": "https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg"
            }
        },
    
    ]
    """
        let jsonData = json.data(using: .utf8)!
        let DogData = try! JSONDecoder().decode([DogElement].self, from: jsonData)
        
        
        DogBreedData.dogBreedData.populateData(dog: DogData)
        XCTAssertEqual("Affenpinscher", DogBreedData.dogBreedData.dogBreed?[0].name)
        XCTAssertEqual("Afghan Hound", DogBreedData.dogBreedData.dogBreed?[1].name)
    }
    
}
