//
//  LoginViewOutput.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    
    func didPressLoginButton(dto: CredentialsDto)
    func initialSetup()
    func viewWillAppear()
    func viewWillDisappear()
}
