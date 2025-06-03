//
//  User.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/29/21.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id : Int
    let firstName, lastName, middleName, email, password, gender, phoneNumber: String
}

