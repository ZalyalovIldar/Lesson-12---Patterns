//
//  LoginViewOutput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    
    /// tells presenter that login button was pressed
    /// - Parameter credentials: credentials dto
    func didPressLoginButton(credentials: CredentialsDto)
    
    /// tells presenter to perform initial setup
    func initialSetup()
    
    /// tells presenter that view will appear
    func viewWillAppear()
    
    /// tells presenter that view will disappear
    func viewWillDisappear()
}
