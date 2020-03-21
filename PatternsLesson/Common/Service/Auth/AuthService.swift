//
//  AuthService.swift
//  PatternsLesson
//
//  Created by Enoxus on 20/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol AuthService: AnyObject {
    
    /// returns true if user is authenticated in app, false otherwise
    func isAuthenticated() -> Bool
}
