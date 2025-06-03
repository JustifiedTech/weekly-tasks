//
//  DogModel.swift
//  Pets
//
//  Created by Decagon on 11/17/21.
//

import Foundation

class DogModel{
    
    
    let id:Int
    let name:String
    let image:String
    var isFavourite:Bool
    
    init(
        dogId:Int,
        dogName:String,
        dogImage:String,
        isDogFavourite:Bool
    ) {
        id = dogId
        name = dogName
        image = dogImage
        isFavourite = isDogFavourite
    }
    
}

struct DogMode{
    
    
    let id:Int
    let name:String
    let image:String
    var isFavourite:Bool
    
    init(
        dogId:Int,
        dogName:String,
        dogImage:String,
        isDogFavourite:Bool
    ) {
        id = dogId
        name = dogName
        image = dogImage
        isFavourite = isDogFavourite
    }
    
}
