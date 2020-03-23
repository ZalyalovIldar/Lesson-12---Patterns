//
//  LoginLoginPresenter.swift
//  Lesson-12---Patterns
//
//  Created by omeeer78 on 21/03/2020.
//  Copyright © 2020 Amir. All rights reserved.
//

class LoginPresenter: LoginViewOutput, LoginInteractorOutput {
                  
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
    func checkedUserDataWith(status: Bool) {
        status ? router.presentSearchController() : router.showErrorAlert()
    }    
    
    //MARK: - Output
    
    func loginButtonPressed(with user: User) {
        interactor.checkData(of: user)
    }
    
    func viewWillAppear() {
        view.clearTextFields()
    }
}
