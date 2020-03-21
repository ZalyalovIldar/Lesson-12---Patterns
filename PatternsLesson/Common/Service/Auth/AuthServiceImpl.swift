//
//  AuthServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 20/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class AuthServiceImpl: AuthService {
    
    func isAuthenticated() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultsKeys.authenticated)
    }
}
