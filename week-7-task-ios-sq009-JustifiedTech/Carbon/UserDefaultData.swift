//
//  UserDefaultData.swift
//  Carbon
//
//  Created by Decagon on 12/8/21.
//

import Foundation


class UserDefaultData{
    
    static let shared = UserDefaultData()
    
    
    func saveData(_ users: [User]) {
        let encodedUsers = try? JSONEncoder().encode(users)
        UserDefaults.standard.set(encodedUsers, forKey: "users")
    }

    func loadUsersFromPhone() -> [User]? {
        
        guard let usersData = (UserDefaults.standard.value(forKey: "users") as? Data) else { return [] }
        
        let users = try? JSONDecoder().decode([User].self, from: usersData)
        return users ?? []
    }
    
    func setUser(isLogin:Bool, user:Int){
        UserDefaults.standard.set(isLogin, forKey: "isLogin")
        UserDefaults.standard.set(user, forKey: "user")
    }
    
    func getUserStatus() -> (Bool, Int) {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        let user = UserDefaults.standard.integer(forKey: "user")
        return (isLogin, user)
        
    }

}
