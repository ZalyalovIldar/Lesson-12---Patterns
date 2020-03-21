//
//  LoginPresenter.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewOutput, LoginInteractorOutput {
    
    /// interactor input
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    weak var view: LoginViewInput!
    
    //MARK: - InteractorOutput
    func didCheckedCredentials(success: Bool) {
        
        if success {
            router.pushSearchViewController(animated: true)
        }
        else {
            router.showWrongCredentialsAlert()
        }
    }
    
    func didCheckedAuth(authenticated: Bool) {
        
        if authenticated {
            router.pushSearchViewController(animated: false)
        }
    }
    
    //MARK: - ViewOutput
    func initialSetup() {
        interactor.checkAuthentication()
    }
    
    
    func didPressLoginButton(credentials: CredentialsDto) {
        interactor.checkCredentials(dto: credentials)
    }
    
    func viewWillAppear() {
        
        view.setHidesNavigationBar(true)
        view.clearAuthFields()
    }
    
    func viewWillDisappear() {
        view.setHidesNavigationBar(false)
    }
}
