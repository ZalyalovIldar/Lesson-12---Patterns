//
//  AuthManager.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol AuthManagerProtocol {
     
    func login(user: User) -> Bool
    func logout()
    func checkAuthorization() -> Bool
}

class AuthManager: AuthManagerProtocol {
    
    private let authUser = User(email: "qwerty@mail.ru", password: "qwerty001")
    
    func login(user: User) -> Bool {
        
        let check = user.email.lowercased() == authUser.email.lowercased() && user.password == authUser.password
        
        UserDefaults.standard.set(check, forKey: Constants.authKey)
        
        return check
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: Constants.authKey)
    }
    
    func checkAuthorization() -> Bool {
        return UserDefaults.standard.bool(forKey: Constants.authKey)
    }
}

