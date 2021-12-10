//
//  ValidationHandler.swift
//  Carbon
//
//  Created by Decagon on 12/7/21.
//

import Foundation

class ValidationHandler {
    
    static let shared = ValidationHandler()
    
    func formHandler(model: Validation) -> (Bool, String) {
        
        var status = true
        var error = ""
        
        if model.firstName?.isEmpty ?? false {
            status = false
            error = "Please enter your first name"
        
            
        }
        
        else if model.middleName?.isEmpty ?? false {
            status = false
            error = "Please enter your middle name"
        }
        
        else if model.lastName?.isEmpty ?? false {
            status = false
            error = "Please enter your last name"
        }
        else if model.email?.isEmpty ?? false {
            status = false
            error = "Please your email address"
        }
        
        else if model.password?.isEmpty ?? false {
            status = false
            error = "Please enter a password"
            
        }
        
        else if model.gender?.isEmpty ?? false {
            status = false
            error = "please select your gender"
        }
        
        else if model.phoneNumber?.isEmpty ?? false {
            status = false
            error = "please enter your phone number"
        }
        
        return (status, error)
    }
}


