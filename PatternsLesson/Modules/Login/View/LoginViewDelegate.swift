//
//  LoginViewDelegate.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    
    /// tells delegate that login button has been pressed and passes the values from auth fields
    /// - Parameter dto: dto that contains auth fields' values
    func didPressLoginButton(dto: CredentialsDto)
}
