//
//  Pet.swift
//  Pets
//
//  Created by Decagon on 11/12/21.
//


//  Pet.swift
import Foundation

struct DogElement: Codable {
    let id:Int?
    let name:String?
    let image:Image?
}

struct Image: Codable {
    let url: String?
}

typealias Dog = [DogElement]
