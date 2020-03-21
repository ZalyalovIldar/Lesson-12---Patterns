//
//  AuthServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 20/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class AuthServiceImpl: AuthService {
    
    var userDefaults: UserDefaults!
    
    func isAuthenticated() -> Bool {
        return userDefaults.bool(forKey: UserDefaultsKeys.authenticated)
    }
}
