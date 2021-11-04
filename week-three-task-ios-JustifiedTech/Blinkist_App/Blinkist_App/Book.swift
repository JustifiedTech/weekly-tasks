//
//  Details.swift
//  Blinkist_App
//
//  Created by Decagon on 10/30/21.
//

import Foundation

//struct ResponseData:Codable{
//    var responseData:[Book]
//}

struct Book:Codable {
    let id:Int
    let title:String
    let author:String
    let book_type:String
    let length:Int
    let image:String
    let description:String;
    let access:String
    
}






