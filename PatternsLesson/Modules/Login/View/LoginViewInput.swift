//
//  LoginViewInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 21/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginViewInput: AnyObject {
    
    /// tells view to hide or show navigation bar
    /// - Parameter hides: true if navbar should be hidden, false otherwise
    func setHidesNavigationBar(_ hides: Bool)
    
    /// removes the values from auth fields
    func clearAuthFields()
}
