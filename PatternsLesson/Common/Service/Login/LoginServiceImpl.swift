//
//  LoginServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class LoginServiceImpl: LoginService {
    
    /// hardcoded user
    private let account = CredentialsDto(login: "Login", password: "Password")
    
    func login(dto: CredentialsDto) -> Bool {
        
        if dto.login == account.login && dto.password == account.password {
            
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.authenticated)
            
            return true
        }
        return false
    }
}
