//
//  LoginLoginViewOutput.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 21/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

protocol LoginViewOutput {

    /// Notify presenter that button pressed
    func loginButtonPressed(with user: User)
    
    /// Notify presenter view will appear
    func viewWillAppear()
}
