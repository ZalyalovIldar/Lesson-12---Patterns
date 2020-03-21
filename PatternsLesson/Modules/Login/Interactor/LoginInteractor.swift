//
//  LoginInteractor.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorInput {
    
    var loginService: LoginService!
    var authService: AuthService!
    /// interactor output
    weak var presenter: LoginInteractorOutput!
    
    func checkCredentials(dto: CredentialsDto) {
        presenter.didCheckedCredentials(success: loginService.login(credentials: dto))
    }
    
    func checkAuthentication() {
        presenter.didCheckedAuth(authenticated: authService.isAuthenticated())
    }
}
