//
//  LoginServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class LoginServiceImpl: LoginService {
    
    var userDefaults: UserDefaults!
    
    /// hardcoded user
    private let account = CredentialsDto(login: "Login", password: "Password")
    
    func login(credentials: CredentialsDto) -> Bool {
        
        if credentials.login == account.login && credentials.password == account.password {
            
            userDefaults.set(true, forKey: UserDefaultsKeys.authenticated)
            
            return true
        }
        return false
    }
}
