//
//  LoginLoginInteractor.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 21/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput!
    private let authManager = AuthManager()
    
    func checkData(of user: User) {
        output.checkedUserDataWith(status: authManager.login(user: user))
    }
}
