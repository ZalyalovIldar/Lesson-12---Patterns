//
//  LogoutServiceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 20/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class LogoutServiceImpl: LogoutService {
    
    var userDefaults: UserDefaults!
    
    func logout() {
        userDefaults.set(false, forKey: UserDefaultsKeys.authenticated)
    }
}
