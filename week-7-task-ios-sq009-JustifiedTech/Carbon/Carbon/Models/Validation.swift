//
//  Validation.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/6/21.
//

import Foundation


class Validation {
    
    var firstName:String?
    var lastName:String?
    var middleName:String?
    var email:String?
    var password:String?
    var gender:String?
    var phoneNumber:String?
    
    init(param:[String:Any]){
        firstName = param["firstName"] as? String
        lastName = param["lastName"] as? String
        middleName = param["middleName"] as? String
        email = param["email"] as? String
        password = param["password"] as? String
        gender = param["gender"] as? String
        phoneNumber = param["phoneNumber"] as? String
    }
}
