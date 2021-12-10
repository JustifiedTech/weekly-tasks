//
//  User.swift
//  Carbon
//
//  Created by Decagon on 11/29/21.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id : Int
    let firstName, lastName, middleName: String
    let email, password, gender, phoneNumber: String
}

