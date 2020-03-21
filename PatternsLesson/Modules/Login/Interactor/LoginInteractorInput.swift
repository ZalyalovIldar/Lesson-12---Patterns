//
//  LoginInteractorInput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginInteractorInput: AnyObject {
    
    /// tells interactor to check if credentials are correct
    /// - Parameter dto: dto to be checked
    func checkCredentials(dto: CredentialsDto)
    /// checks if user is already authenticated
    func checkAuthentication()
}
